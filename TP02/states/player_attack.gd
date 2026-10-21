class_name PlayerAttack
extends BaseState

@export var player : Player
var anim_player : AnimationPlayer

func enter():
	anim_player = player.get_animation_player()
	anim_player.play("attack")

func _input(event: InputEvent) -> void:
	handle_inputs(event)

func handle_inputs(input_event: InputEvent) -> void :
	pass

func update(delta: float) -> void:
	if not anim_player :
		anim_player = player.get_animation_player()
	
	if not anim_player.is_playing():
		Transitioned.emit(self, "Idle")

func physics_update(delta: float) -> void:
	if not anim_player : return
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)

func exit() -> void:
	pass
