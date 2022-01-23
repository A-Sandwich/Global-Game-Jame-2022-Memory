extends Area2D

var can_grab = false
# Declare member variables here. Examples:
var word = ""
var static_word = true

func _ready():
	if word == "":
		set_word("test")

func _process(delta):
	if static_word:
		return
	if Input.is_action_pressed("grab") and can_grab:
		global_position = get_tree().root.get_viewport().get_mouse_position()
	if Input.is_action_just_released("grab"):
		can_grab = false

func set_word(word, static_word = true):
	self.word = word
	self.static_word = static_word
	$Label.text = word

func _on_Word_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name != "Player":
		return
	WordManager.word_collected(word)
	queue_free()


func _on_Word_mouse_entered():
	can_grab = true


func _on_Word_mouse_exited():
	if not Input.is_action_pressed("grab"):
		can_grab = false
