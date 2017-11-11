extends "res://Scripts/Paddle.gd"

func process_move_commands():
	if (Input.is_action_pressed("paddle_up")):
		move_up()
	if (Input.is_action_pressed("paddle_left")):
		move_left()
	if (Input.is_action_pressed("paddle_down")):
		move_down()
	if (Input.is_action_pressed("paddle_right")):
		move_right()