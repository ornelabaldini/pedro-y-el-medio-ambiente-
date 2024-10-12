extends Area2D
signal hit
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var score = 0
var HUD_scene

func _ready():
	screen_size = get_viewport_rect().size
	

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if velocity.x != 0:
		$AnimatedSprite.animation = "caminar"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "arriba"
		$AnimatedSprite.flip_v = velocity.y > 0
		
func _on_Player_body_entered(body):
	if body.is_in_group("mobs"):
		score = 0
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)
	elif body.is_in_group("rec"):
		score += 1
		get_node("../HUD").update_score(score)
		body.hide()
		if score == 5:
			body.hide()
			emit_signal("hit")
			$CollisionShape2D.set_deferred("disabled", true)
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
	
			

		
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
