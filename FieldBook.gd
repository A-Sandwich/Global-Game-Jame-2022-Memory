extends Area2D

var can_remember = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_remember and Input.is_action_pressed("action_button"):
		get_tree().change_scene("res://Book.tscn")


func _on_FieldBook_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	can_remember = true


func _on_FieldBook_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	can_remember = false
