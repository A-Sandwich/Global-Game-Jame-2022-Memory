extends Node2D

var number_of_trees = 10
var TREE = preload("res://Tree.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var screen_size = get_viewport_rect().size
	var half_screen_x = screen_size.x / 2
	var half_screen_y = screen_size.y / 2
	for i in range(0, number_of_trees):
		var tree = TREE.instance()
		add_child(tree)
		tree.global_position.x = rng.randi_range(-half_screen_x, half_screen_x)
		tree.global_position.y = rng.randi_range(-half_screen_y, half_screen_y)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
