extends Control


func _on_RetryButton_pressed():
	get_tree().reload_current_scene()

func _on_Goal1_player_score_update(score):
	$ScorePlayer1.text = "%02d" % score

func _on_Goal2_player_score_update(score):
	$ScorePlayer2.text = "%02d" % score

func _on_Goal1_player_won():
	$VictoryPanel/PlayerName.text = "Player 1"
	$VictoryPanel.show()

func _on_Goal2_player_won():
	$VictoryPanel/PlayerName.text = "Player 2"
	$VictoryPanel.show()

func _on_Ball_hitted():
	if $Feedback.text == "PING!":
		$Feedback.text = "PONG!"
	else:
		$Feedback.text = "PING!"
	
	$Feedback.show()
	$FeedbackTimer.start()

func _on_BallFeedbackTimer_timeout():
	$Feedback.hide()
