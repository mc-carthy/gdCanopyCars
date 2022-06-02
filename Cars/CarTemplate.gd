extends VehicleBody

export var player_id: int = 0
export var car_name: String = ''
export var max_speed: float = 20
export var throttle: float = 210000
export var max_steer: float = 15
export var max_health: float = 100

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	engine_force = 0
	if Input.is_action_pressed("Player_1_Forward"):
		if linear_velocity.length() < max_speed:
			engine_force = throttle * delta
	if Input.is_action_pressed("Player_1_Back"):
		if linear_velocity.length() < max_speed:
			engine_force = -throttle * delta

	steering += (Input.get_action_strength("Player_1_Left") - Input.get_action_strength("Player_1_Right")) * delta
	steering = clamp(steering, -max_steer, max_steer)
	steering = lerp(steering, 0, 0.1)
