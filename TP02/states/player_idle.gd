class_name PlayerIdle
extends BaseState

@export var player : Player
var anim_player : AnimationPlayer

func enter():
	anim_player = player.get_animation_player()

func _input(event: InputEvent) -> void:
	handle_inputs(event)

func handle_inputs(input_event: InputEvent) -> void :
	if Input.get_axis("Left", "Right") != 0:
		Transitioned.emit(self, "Run")
	
	if Input.is_action_just_pressed("Jump"):
		Transitioned.emit(self, "Jump")
		return

func update(delta: float) -> void:
	if not anim_player :
		anim_player = player.get_animation_player()

func physics_update(delta: float) -> void:
	if not anim_player : return

	anim_player.play("idle")
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)

func exit() -> void:
	pass
