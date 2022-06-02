extends VehicleBody

export var player_id: int = 1
export var car_name: String = ''
export var max_speed: float = 20
export var throttle: float = 210000
export var max_steer: float = 15
export var max_health: float = 100

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	engine_force = 0
	if Input.is_action_pressed("Player_" + str(player_id) + "_Forward"):
		if linear_velocity.length() < max_speed:
			engine_force = throttle * delta
	if Input.is_action_pressed("Player_" + str(player_id) + "_Back"):
		if linear_velocity.length() < max_speed:
			engine_force = -throttle * delta

	steering += (Input.get_action_strength("Player_" + str(player_id) + "_Left") - Input.get_action_strength("Player_" + str(player_id) + "_Right")) * delta
	steering = clamp(steering, -max_steer, max_steer)
	steering = lerp(steering, 0, 0.1)
