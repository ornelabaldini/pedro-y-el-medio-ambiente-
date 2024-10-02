extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
func show_game_over():
	show_message(  "Perdiste")
	$AnimatedSprite2.show()
	$AnimatedSprite3.show()
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Recolecta los\n reciclables!\n Cuidado con los\n   zombies..."
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$AnimatedSprite2.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
	$AnimatedSprite.hide()
	$StartButton.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
