extends KinematicBody2D

const DIRECTIONS = [Vector2(-1, -1), Vector2(-1, 1), Vector2(1, -1), Vector2(1, 1)]

export var SPAWN_POINT : Vector2
export var SPEED : float

var velocity : Vector2 

func _ready():
	change_direction()
	
func _physics_process(delta):	
	if get_slide_count() >= 1:
		var collision = get_slide_collision(0)
		handle_collision(collision)
	
	move_and_slide(velocity)

func handle_collision(collision):
	var direction = collision.position - position
	
	if abs(direction.x) > abs(direction.y):
		velocity.x *= -1
	else:
		velocity.y *= -1

func change_direction():
	velocity = DIRECTIONS[randi() % len(DIRECTIONS)] * SPEED

func _on_Goal_player_won():
	position = SPAWN_POINT
	velocity = Vector2.ZERO
	hide()

func _on_Goal_player_score_update(score):
	position = SPAWN_POINT
	change_direction()
