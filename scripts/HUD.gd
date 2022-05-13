extends Control

func _on_Goal_player_won(player):
	$VictoryPanel/PlayerName.text = player
	$VictoryPanel.show()

func _on_RetryButton_pressed():
	get_tree().reload_current_scene()
