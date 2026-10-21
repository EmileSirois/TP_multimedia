class_name PlayerJump
extends BaseState

@export var player : Player
var anim_player : AnimationPlayer
var direction : float = 0.0

func enter():
	anim_player = player.get_animation_player()
	direction = Input.get_axis("Left", "Right")

	if player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY

func _input(event: InputEvent) -> void:
	handle_inputs(event)

func handle_inputs(input_event: InputEvent) -> void :
	direction = Input.get_axis("Left", "Right")
	
	if Input.is_action_just_pressed("Attack"):
		Transitioned.emit(self, "Attack")
	
func update(delta: float) -> void:
	if not anim_player :
		anim_player = player.get_animation_player()
	
	if direction != 0:
		player.sprite.flip_h = direction < 0

func physics_update(delta: float) -> void:
	if not anim_player : return

	player.velocity.x = direction * player.SPEED
	
	if player.is_on_floor() and player.velocity.y >= 0:
		if direction != 0:
			Transitioned.emit(self, "Run")
		else:
			Transitioned.emit(self, "Idle")

func exit() -> void:
	pass
