extends KinematicBody2D

export var Speed = 250

var Direction = Vector2(1, 1).normalized()
var Collisions = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):	
	if (is_colliding()):
		# ball will always bounce perpendicular to the plane it collides with
		# this is fine for the paddle but looks awkward on walls
		Direction = (get_pos() - get_collision_pos()).normalized()
		
		Collisions += 1
		get_node("../TestScore").set_text(str(Collisions))
	
	move(Direction * Speed * delta)