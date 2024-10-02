extends RigidBody2D

func _ready():
	$AnimatedSprite.playing = true
	var rec_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = rec_types[randi() % rec_types.size()]
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
