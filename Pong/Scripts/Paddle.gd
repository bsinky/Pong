extends KinematicBody2D

export var Speed = 220;

var Direction = Vector2(0,0)

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	paddle_movement(delta)
	
func move_up():
	Direction.y -= 1
	
func move_left():
	Direction.x -= 1
	
func move_down():
	Direction.y += 1
	
func move_right():
	Direction.x += 1
	
func paddle_movement(delta):
	Direction = Vector2(0, 0)
	
	process_move_commands()
	
	move(Direction.normalized() * Speed * delta)
	
func process_move_commands():
	pass
