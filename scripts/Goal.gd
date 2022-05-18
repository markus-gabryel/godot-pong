extends Area2D

signal player_won

export var player := "Player0"

func _on_Goal_body_entered(body):
	if body.name == "Ball":
		# emit_signal("player_won", player)
		body.position = Vector2(512,300)
		body.change_direction()
