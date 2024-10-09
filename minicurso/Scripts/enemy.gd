extends CharacterBody2D

var player = null
var Speed = 50

func _physics_process(delta: float) -> void:
	if player != null:
		velocity = global_position.direction_to(player.global_position)
		if velocity.x > 0:
			$AnimatedSprite2D.play("Move")
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0: 
			$AnimatedSprite2D.play("Move")
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.play("Idle")
	
	move_and_collide(velocity * Speed * delta)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		player = body
		
