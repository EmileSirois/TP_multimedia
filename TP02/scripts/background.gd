extends Node2D

@export var min_scale : float = 0.05
@export var max_scale : float = 0.9
@export var vertical_factor : float = 0.3

func _ready() -> void:
	var layers : Array = get_children().filter(func(c): return c is Parallax2D)
	var count : int = layers.size()

	for i in count:
		var t : float = float(i) / max(count - 1, 1)
		var s : float = lerp(min_scale, max_scale, t)
		layers[i].scroll_scale = Vector2(s, s * vertical_factor)
