extends Area2D

var is_shakable = false
var time_since_last_shake = 0
var word = preload("res://Word.tscn")
var can_spawn_word = true
var rng = RandomNumberGenerator.new()
var target_position = Vector2.ZERO
var target_offset = 2
var shake_amount = 2

var original_position = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = global_position
	rng.randomize()
	target_position = global_position

func _process(delta):
	
	if Input.is_action_pressed("action_button"):
		if $wordSpawn.is_stopped():
			$wordSpawn.start()
		if can_spawn_word:
			spawn_word()
		shake_dat_tree(delta)
	if Input.is_action_just_released("action_button"):
		$wordSpawn.stop()
		
func shake_dat_tree(delta):
	if Input.is_action_just_pressed("action_button"):
		time_since_last_shake = 0
	else:
		time_since_last_shake += delta
	if target_position == global_position:
		target_position.x -= target_offset
		target_offset = target_offset * -1
		shake_amount = shake_amount * -1
	if time_since_last_shake > 0.07:
		time_since_last_shake = 0
		if global_position.x != target_position.x:
			global_position.x += shake_amount
			
func _on_Tree_body_entered(body):
	is_shakable = true

func _on_Tree_body_exited(body):
	is_shakable = false

func _on_wordSpawn_timeout():
	can_spawn_word = true

func spawn_word():
	can_spawn_word = false
	$wordSpawn.start()
	var word_instance = word.instance()
	word_instance.global_position = Vector2(global_position.x + rng.randi_range(-100, 100), global_position.y + rng.randi_range(-100, 100))
	get_parent().add_child(word_instance)
