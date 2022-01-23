extends Node2D


# Declare member variables here. Examples:
# var a = 2
var WORD = preload("res://Word.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var screen_size = get_viewport_rect().size
	for word in WordManager.collected_words:
		var word_to_drag = WORD.instance()
		word_to_drag.set_word(word, false)
		word_to_drag.position = Vector2(rng.randi_range(0, 500), rng.randi_range(0, 500))
		add_child(word_to_drag)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
