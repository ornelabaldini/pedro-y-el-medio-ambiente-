extends Area2D
signal hit
export var speed = 400 
var screen_size 
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
		
	if body.is_in_group("rec"): 
		score += 1
		get_node("../HUD").update_score(score)
		body.queue_free()
		$recolecta.play()
		yield(get_tree().create_timer(0.5), "timeout")
		$recolecta.stop()
		if score == 15:
			get_node("../HUD").ganaste()
			$CollisionShape2D.set_deferred("disabled", true)
			score = 0
			hide()
	
			
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func _on_Player_body_shape_entered(): 
	pass
	
func _on_Player_hit():
  pass
