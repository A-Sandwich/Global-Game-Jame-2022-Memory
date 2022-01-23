extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var collected_words = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func word_collected(word):
	collected_words.append(word)
