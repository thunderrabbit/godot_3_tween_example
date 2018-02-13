extends Node2D

const SpriteSet = preload("res://spriteset.tscn")

func _ready():
	var my_sprite_set = SpriteSet.instance()
	my_sprite_set.set_layout([3,1,0,1,0,1])
	my_sprite_set.set_position(Vector2(200,200))
	add_child(my_sprite_set)
	my_sprite_set.tween_set()