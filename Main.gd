extends Node

export(PackedScene) var mob_scene
export(PackedScene) var rec_scene
var score

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

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Preparate!")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_StartTimer_timeout():
	$MobTimer.start()
	$RecTimer.start()
	$ScoreTimer.start()

func recolectar_reciclable():
	var reciclable_recolectado = 0
	score += 1
	reciclable_recolectado += 1
	$HUD.update_score(score)
	$RigidBody2D.hide()
	if reciclable_recolectado == 10:
		$music.stop()
		$AnimatedSprite5.show()
		$AnimatedSprite6.show()
		$ganaste.show()

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
