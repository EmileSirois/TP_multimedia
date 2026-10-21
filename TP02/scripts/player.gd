extends CharacterBody2D
class_name Player

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
const SPEED = 140.0
const JUMP_VELOCITY = -300.0

func get_animation_player() -> AnimationPlayer:
	return anim_player

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
