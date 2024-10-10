extends CollisionPolygon2D
var score

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.score += 1
		print("Puntos: ", body.puntos)
		queue_free()

func _on_CollisionPolygon2D_child_entered_tree(node):
	pass # Replace with function body.
