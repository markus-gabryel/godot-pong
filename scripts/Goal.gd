extends Area2D

signal player_won
signal player_score_update

export var player := "Player0"
export var score = 0

func _on_Goal_body_entered(body):
	if body.name == "Ball":
		score += 1
		emit_signal("player_score_update", score)
		
		if score >= 2:
			emit_signal("player_won")
