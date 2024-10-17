extends Node

export(PackedScene) var mob_scene
export(PackedScene) var rec_scene

func _ready():
	randomize()
	new_game()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$RecTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
func parar_musica():
	$Music.stop()
	
func new_game():
	print("newGame")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score($Player.score)
	$HUD.show_message("Recolecta 15\n reciclables!\n Cuidado con los\n  zombies...")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)

func _on_ScoreTimer_timeout():
	pass

func _on_StartTimer_timeout():
	$MobTimer.start()
	$RecTimer.start()
	$ScoreTimer.start()


func _on_RecTimer_timeout():
	var rec = rec_scene.instance()
	var rec_spawn_location = get_node("MobPath/MobSpawnLocation")
	rec_spawn_location.offset = randi()
	var direction2 = rec_spawn_location.rotation + PI / 2
	rec.position = rec_spawn_location.position
	direction2 += rand_range(-PI / 4, PI / 4)
	rec.rotation = direction2
	var velocity2 = Vector2(rand_range(150.0, 250.0), 0.0)
	rec.linear_velocity = velocity2.rotated(direction2)
	add_child(rec)

