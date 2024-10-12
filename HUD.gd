extends CanvasLayer
signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$AnimatedSprite5.hide()
	$AnimatedSprite6.hide()
	$Message2.hide()
	$Message3.show()

func show_ganaste():
	$AnimatedSprite5.show()
	$AnimatedSprite6.show()
	$Message3.hide()
	yield($MessageTimer, "timeout")
	$Message.text = "Recolecta 15\n reciclables para ganar!\n Cuidado con los\n  zombies..."
	$Message.show()
	$Message3.hide()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	$Message2.show()	
			
func show_game_over():
	show_message("                Perdiste")
	$AnimatedSprite2.show()
	$AnimatedSprite3.show()
	$AnimatedSprite4.show()
	$AnimatedSprite.show()
	$Message3.hide()
	yield($MessageTimer, "timeout")
	$Message.text = "Recolecta 15\n reciclables para ganar!\n Cuidado con los\n  zombies..."
	$Message.show()
	$Message3.hide()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	$AnimatedSprite4.hide()
	
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite4.hide()
	$AnimatedSprite8.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
	$AnimatedSprite.hide()
	$StartButton.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite7.hide()
	$AnimatedSprite8.hide()
	$Message3.hide()
	



