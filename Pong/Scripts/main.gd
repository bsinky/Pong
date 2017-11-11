extends Node

#old tutorial code

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var screen_size
var pad_size
var direction = Vector2(1.0, 0.0)

const INITIAL_BALL_SPEED = 80
var ball_speed = INITIAL_BALL_SPEED
const PAD_SPEED = 150

var initial_ball_pos

func _ready():
	pass
	#screen_size = get_viewport().get_rect().size
	#pad_size = get_node("left").get_texture().get_size() * get_node("left").get_scale()
	#initial_ball_pos = get_node("ball").get_pos()
	#set_process(true)
	
func _process(delta):
	_set_ball_pos(delta)
	
	var left_pos = get_node("left").get_pos()
	
	if (left_pos.y < screen_size.y && Input.is_action_pressed("left_move_down")):
		left_pos.y += PAD_SPEED * delta
	if (left_pos.y > 0 && Input.is_action_pressed("left_move_up")):
		left_pos.y -= PAD_SPEED * delta
		
	get_node("left").set_pos(left_pos)
	
	var right_pos = get_node("right").get_pos()
	
	if (right_pos.y < screen_size.y && Input.is_action_pressed("right_move_down")):
		right_pos.y += PAD_SPEED * delta
	if (right_pos.y > 0 && Input.is_action_pressed("right_move_up")):
		right_pos.y -= PAD_SPEED * delta
	
	get_node("right").set_pos(right_pos)

func _set_ball_pos(delta):
	var ball_pos = get_node("ball").get_pos()
	var left_rect = Rect2(get_node("left").get_pos() - pad_size * .5, pad_size)
	var right_rect = Rect2(get_node("right").get_pos() - pad_size * .5, pad_size)
	
	ball_pos += direction * ball_speed * delta
	
	if ((ball_pos.y > screen_size.y && direction.y > 0) || (ball_pos.y < 0 && direction.y < 0)):
		direction.y *= -1
	
	if (left_rect.has_point(ball_pos) && direction.x < 0):
		var displacement =  ball_pos.y - get_node("left").get_pos().y
		direction.y = (displacement / pad_size.y) * 2
		direction.x *= -1
		ball_speed *= 1.1
		
	if (right_rect.has_point(ball_pos) && direction.x > 0):
		var displacement = ball_pos.y - get_node("right").get_pos().y 
		direction.y = (displacement / pad_size.y) * 2
		direction.x *= -1
		ball_speed *= 1.1
		
	if (ball_pos.x < 0 || ball_pos.x > screen_size.x):
		ball_pos = initial_ball_pos
		ball_speed = INITIAL_BALL_SPEED
		direction = Vector2(1.0, 0.0)
		
	get_node("ball").set_pos(ball_pos)
