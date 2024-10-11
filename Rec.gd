extends RigidBody2D
var score

func _ready():
	$AnimatedSprite.playing = true
	var rec_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = rec_types[randi() % rec_types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func recolectar_reciclable():
	queue_free()
	get_node("../Main").recolectar_reciclable()
		
func _on_RigidBody2D_hit(body):
	if body.is_in_group("Player"):
		recolectar_reciclable()

