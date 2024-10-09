extends CharacterBody2D


@export var SPEED = 150.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction.x != 0 or direction.y != 0:
		$Animation.play("Move")
		if direction.x > 0:
			$Animation.flip_h = false
		else:
			$Animation.flip_h = true
	else:
		$Animation.play("Idle")
		
	velocity = direction * SPEED
	move_and_slide()
