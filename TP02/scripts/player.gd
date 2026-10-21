extends CharacterBody2D
class_name Player

const SPEED = 140.0
const JUMP_VELOCITY = -300.0

var anim_player : AnimationPlayer
var sprite : Sprite2D

func _ready() -> void:
	anim_player = $AnimationPlayer
	sprite = $Sprite2D
	anim_player.play("idle")

func _physics_process(delta: float) -> void:
	move_and_slide()
