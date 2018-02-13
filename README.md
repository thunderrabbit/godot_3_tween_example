# godot_3_tween_example

My tweens from Godot 2.1.4 didn't work in Godot 3.  Let's find out why!

* game.gd instantiates spriteset.
* spriteset.gd adds some sprites to itself.
* game.gd asks spriteset to tween.
* the tween runs, but is not visible.
