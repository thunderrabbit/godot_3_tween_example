# godot_3_tween_example

My tweens from Godot 2.1.4 didn't work in Godot 3.  Here's why!

* game.gd instantiates spriteset.
* spriteset.gd adds some sprites to itself.
* game.gd asks spriteset to tween.
* the tween runs, but is not visible.

Why?

Thank you /u/cbscribe

* In 3.0, the various set_* methods have been replaced in favor of direct access to object member variables. So to change a sprite's opacity, you would use$Sprite.modulate.a = 0.5 for example.

* To tween the property, since the value is a Color, you have to give two colors as an argument. So to just fade the sprite you'd do this (just tried this out, and it worked perfectly):

$Tween.interpolate_property($Sprite, "modulate", 
    Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, 
    Tween.TRANS_LINEAR, Tween.EASE_IN)

https://www.reddit.com/r/godot/comments/6uyefm/how_to_tween_opacity_of_a_sprite_in_godot_3_alpha/dlwnbb3/
