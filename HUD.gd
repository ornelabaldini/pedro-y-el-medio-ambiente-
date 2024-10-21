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
	$jugar_de_nuevo.hide()
	$Message4.hide()
	$salir.show()


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
	$jugar_de_nuevo.hide()
	$AnimatedSprite4.hide()
	$Message4.hide()
	$salir.show()
	

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	$jugar_de_nuevo.hide()
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite4.hide()
	$AnimatedSprite8.hide()
	$AnimatedSprite7.hide()
	$Message3.hide()
	get_parent().new_game()
	emit_signal("start_game")
	$salir.hide()
	
	

func _on_MessageTimer_timeout():
	$Message.hide()
	$AnimatedSprite.hide()
	$StartButton.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite7.hide()
	$AnimatedSprite8.hide()
	$Message3.hide()
	$salir.show()
	$AnimatedSprite.hide()
	
func ganaste():
	$jugar_de_nuevo.show()
	$AnimatedSprite5.show()
	$AnimatedSprite6.show()
	$Message2.show()
	$ScoreLabel.hide()
	$Message3.hide()
	get_node("/root/Main").parar_musica()
	$ganaste.play()
	yield(get_tree().create_timer(0.7), "timeout")
	$ganaste.stop()
	get_tree().call_group("mobs", "queue_free")
	get_tree().call_group("rec", "queue_free")
	$salir.show()
	
	


func _on_jugar_de_nuevo_pressed():
	_on_StartButton_pressed()
	$ScoreLabel.show()
	$ganaste.stop()
	$AnimatedSprite.show()


func _on_salir_pressed():
	$Message4.show()
	$Message.hide()
	$ScoreLabel.hide()
	$AnimatedSprite.hide()
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().quit()
	
