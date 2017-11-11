extends KinematicBody2D

export var Speed = 220;

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	var direction = Vector2(0, 0)
	if (Input.is_action_pressed("paddle_up")):
		direction.y -= 1
	if (Input.is_action_pressed("paddle_left")):
		direction.x -= 1
	if (Input.is_action_pressed("paddle_down")):
		direction.y += 1
	if (Input.is_action_pressed("paddle_right")):
		direction.x += 1
	
	move(direction.normalized() * Speed * delta)
