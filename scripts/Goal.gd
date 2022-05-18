extends Area2D

signal player_won

export var player := "Player0"
export var player_score = 0
export var text = ""

func _on_Goal_body_entered(body):
	if body.name == "Ball":
		# emit_signal("player_won", player)
		body.position = Vector2(512,300)
		body.change_direction()
		player_score += 1
		if player_score == 2:
			emit_signal("player_won", player)
			get_tree().call_group("Ball", "stop_ball")
		print(player," ", player_score, " points")
