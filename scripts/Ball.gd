extends KinematicBody2D

export var SPEED : float

var velocity : Vector2 

func _ready():
	var directions = [Vector2(-1, -1), Vector2(-1, 1), Vector2(1, -1), Vector2(1, 1)]
	velocity = directions[randi() % 4] * SPEED
	
func _physics_process(delta):	
	if get_slide_count() >= 1:
		handle_collision(get_slide_collision(0))
	
	move_and_slide(velocity)

func handle_collision(collision):
	var direction = collision.position - position

	if abs(direction.x) > abs(direction.y):
		velocity.x *= -1
		print("left-right")
	else:
		velocity.y *= -1
		print("up-down")
	
	
