extends Node2D

const texture = preload("res://icon.png")


# add sprites to this object in the layout specified by array
# sprite_layout is a width-prefixed 1D array which represents a 2D layout
func set_layout(sprite_layout):
    var width = int(sprite_layout[0]) # is a float otherwise.. why??
    var num = 0					# how far along 1D array are we?
    var loc = Vector2(0,0)		# where the layout will be shown
    # Loop through the bits of array after width
    for i in range(1, sprite_layout.size()):
        num = i - 1   # i starts at 1 due to width at position 0
        var bit = sprite_layout[i]
        if bit == 1:
            # x and y are determined by how far along 1D array we are
            var x = num % width
            var y = num / width
            loc = Vector2(x,y)			# where to put new sprite
            var sprite = Sprite.new()
            sprite.set_texture(texture)
            sprite.set_position(loc * Vector2(60,60))
            add_child(sprite)

func tween_set():
	var ratio = 0.2
	var effect = get_node("Tween")
	effect.interpolate_property(self, "scale",
			self.get_scale(), Vector2(ratio, ratio), 0.9,
			Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property(self, "position",
			self.get_position(), Vector2(0,0), 0.9,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	effect.start()
	print("started tween sprite_set (but it sure doesnt look like it)")
	print("tween is active?")
	print(effect.is_active())