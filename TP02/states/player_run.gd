class_name PlayerRun
extends BaseState

@export var player : Player
var anim_player : AnimationPlayer
var direction : float = 0.0

func enter():
	anim_player = player.get_animation_player()

func _input(event: InputEvent) -> void:
	handle_inputs(event)

func handle_inputs(input_event: InputEvent) -> void :
	direction = Input.get_axis("Left", "Right")

	if direction == 0:
		Transitioned.emit(self, "Idle")
	elif Input.is_action_just_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	elif Input.is_action_just_pressed("Attack"):
		Transitioned.emit(self, "Attack")


func update(delta: float) -> void:
	if not anim_player :
		anim_player = player.get_animation_player()
	
	if direction != 0:
		player.sprite.flip_h = direction < 0

func physics_update(delta: float) -> void:
	if not anim_player : return

	anim_player.play("run")
	
	player.velocity.x = direction * player.SPEED

func exit() -> void:
	pass
