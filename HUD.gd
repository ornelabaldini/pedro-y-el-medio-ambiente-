extends CanvasLayer

func show_message(text):
	$StartButton.hide()
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
	show_message("Puntaje:↑  \n\n                     Buen puntaje ")
	$jugar_de_nuevo.show()
	$AnimatedSprite2.show()
	$AnimatedSprite3.show()
	$AnimatedSprite4.show()
	$AnimatedSprite.show()
	$salir.show()
	
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	get_parent().new_game()


func _on_MessageTimer_timeout():
	$StartButton.hide()
	$Message.hide()
	$AnimatedSprite5.hide()
	$AnimatedSprite7.hide()
	$AnimatedSprite8.hide()
	$Message3.hide()
	$salir.show()
	
	
func ganaste():
	show_message("Puntaje:↑")
	$jugar_de_nuevo.show()
	$AnimatedSprite5.show()
	$AnimatedSprite6.show()
	$Message2.show()
	$Message3.hide()
	$Message4.show()
	get_node("/root/Main").parar_musica()
	$ganaste.play()
	yield(get_tree().create_timer(0.7), "timeout")
	$ganaste.stop()
	get_tree().call_group("mobs", "queue_free")
	get_tree().call_group("rec", "queue_free")
	$salir.show()

	


func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$StartButton.hide()
	$HUD.update_score($Player.score)
	$HUD.show_message("Recolecta los\n reciclables!\n Cuidado con los\n  zombies...")
	get_tree().call_group("mobs", "queue_free")
	get_tree().call_group("rec", "queue_free")
	$Music.play()
	

func _on_jugar_de_nuevo_pressed():
	_on_StartButton_pressed()


func ocultar_menu_principal():
	$StartButton.hide()
	$jugar_de_nuevo.hide()
	$Message2.hide()
	$Message3.hide()
	$Message.hide()
	$ScoreLabel.hide()
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$AnimatedSprite5.hide()
	$AnimatedSprite7.hide()
	$AnimatedSprite6.hide()
	$AnimatedSprite8.hide()
	get_parent().get_child(0).queue_free()
	get_parent().get_child(7).stop()
	

func _on_salir_pressed():
	ocultar_menu_principal()
	$Message4.show()
	yield(get_tree().create_timer(4), "timeout")
	get_tree().quit()
	
