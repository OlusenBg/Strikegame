extends CharacterBody2D


@export var speed_increase = 100
@export var speed: float = 0
@export var speed_limit = 5000


func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO
	
	
	if Input.is_action_pressed("right"):
		if speed < speed_limit:
			speed += speed_increase
			print(speed)
	if Input.is_action_just_released("right"):
		input.x += 1
		print(speed)
		velocity = input.normalized() * speed * delta
		speed = 0
	
	if Input.is_action_pressed("left"):
		if speed < speed_limit:
			speed += speed_increase
		
	if Input.is_action_just_released("left"):
		input.x -= 1
		print(speed)
		velocity = input.normalized() * speed * delta
		speed = 0
	
	
	if Input.is_action_pressed("up"):
		if speed < speed_limit:
			speed += speed_increase
		print(speed)
	if Input.is_action_just_released("up"):
		input.y -= 1
		print(speed)
		velocity = input.normalized() * speed * delta
		speed = 0
	
	
	if Input.is_action_pressed("down"):
		if speed < speed_limit:
			speed += speed_increase
		
	if Input.is_action_just_released("down"):
		input.y += 1
		
		velocity = input.normalized() * speed * delta
		speed = 0
	
	
	
	
	if input.x == 0 && input.y == 0 && velocity.x > 0:
		velocity.x -= speed_increase
	elif input.x == 0 && input.y == 0 && velocity.x < 0:
		velocity.x += speed_increase
	if input.x == 0 && input.y == 0 && velocity.y < 0:
		velocity.y += speed_increase
	elif input.x == 0 && input.y == 0 && velocity.y > 0:
		velocity.y -= speed_increase
	
	
	
	
	move_and_slide()
