extends CharacterBody2D


@export var speed_increase = 100
@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO
	
	
	if Input.is_action_pressed("right"):
		speed += speed_increase
		print(speed)
	if Input.is_action_just_released("right"):
		input.x += 1
		print(speed)
		velocity = input.normalized() * speed
		speed = 200
	
	if Input.is_action_pressed("left"):
		speed += speed_increase
		print(speed)
	if Input.is_action_just_released("left"):
		input.x -= 1
		print(speed)
		velocity = input.normalized() * speed
		speed = 200
	
	
	if Input.is_action_pressed("up"):
		speed += speed_increase
		print(speed)
	if Input.is_action_just_released("up"):
		input.y -= 1
		print(speed)
		velocity = input.normalized() * speed
		speed = 200
	
	
	if Input.is_action_pressed("down"):
		speed += speed_increase
		print(speed)
	if Input.is_action_just_released("down"):
		input.y += 1
		print(speed)
		velocity = input.normalized() * speed
		speed = 200
	
	if input.x == 0 && input.y == 0 && velocity.x > 0:
		velocity.x -= speed_increase
	elif input.x == 0 && input.y == 0 && velocity.x < 0:
		velocity.x += speed_increase
	elif input.x == 0 && input.y == 0 && velocity.y < 0:
		velocity.y += speed_increase
	elif input.x == 0 && input.y == 0 && velocity.y > 0:
		velocity.y -= speed_increase
	
	move_and_slide()
