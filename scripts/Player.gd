extends KinematicBody2D

export var SPEED : float
export var UP_KEY := "ui_up"
export var DOWN_KEY := "ui_down"

var velocity := Vector2.ZERO

func _physics_process(delta):
	var up = Input.is_action_pressed(UP_KEY)
	var down = Input.is_action_pressed(DOWN_KEY)
	
	velocity.y = (int(down) - int(up)) * SPEED
	velocity = move_and_slide(velocity)
