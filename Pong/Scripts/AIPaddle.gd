extends "res://Scripts/Paddle.gd"

var ball = null

func process_move_commands():
	if (ball == null):
		ball = get_node("../Ball")
	
	var ball_pos = ball.get_pos()
	var paddle_pos = get_pos()
	if (ball_pos.y > paddle_pos.y):
		move_down()
	elif (ball_pos.y < paddle_pos.y):
		move_up()