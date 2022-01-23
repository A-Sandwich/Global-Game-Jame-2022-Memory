extends KinematicBody2D


# Declare member variables here. Examples:
var movement_direction = Vector2()
var movement_speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement_direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		movement_direction.x = 1
	if Input.is_action_pressed("move_left"):
		movement_direction.x = -1
	if Input.is_action_pressed("move_up"):
		movement_direction.y = -1
	if Input.is_action_pressed("move_down"):
		movement_direction.y = 1
	var collision = move_and_collide(movement_direction * movement_speed * delta)
