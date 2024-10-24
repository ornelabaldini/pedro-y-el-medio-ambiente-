extends RigidBody2D

var timer = 2
var probabilidad = 0.5


func _ready():
	$AnimatedSprite.playing = true
	var rec_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = rec_types[randi() % rec_types.size()]


func _process(delta):
	timer -= delta
	if timer <= 0:
		if randf() < probabilidad:
			# Código para aparecer objeto
			pass
		timer = 2

	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
