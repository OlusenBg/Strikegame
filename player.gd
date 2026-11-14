extends CharacterBody2D

@export var speed_increase = 75
@export var speed: float = 0
@export var speed_limit = 3000
var charged = false

func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO
	
	var move_right = Input.is_action_pressed("move_right")
	var move_left = Input.is_action_pressed("move_left")
	var move_up = Input.is_action_pressed("move_up")
	var move_down = Input.is_action_pressed("move_down")
	
	
	if Input.is_action_pressed("right"):
		if speed < speed_limit:
			speed += speed_increase
	if Input.is_action_just_released("right"):
		input.x += 1
		velocity = input.normalized() * speed 
		speed = 0
		charged = true
	
	if Input.is_action_pressed("left"):
		if speed < speed_limit:
			speed += speed_increase
		
	if Input.is_action_just_released("left"):
		input.x -= 1
		velocity = input.normalized() * speed
		speed = 0
		charged = true
	
	
	if Input.is_action_pressed("up"):
		if speed < speed_limit:
			speed += speed_increase
	if Input.is_action_just_released("up"):
		input.y -= 1
		velocity = input.normalized() * speed 
		speed = 0
		charged = true
	
	
	if Input.is_action_pressed("down"):
		if speed < speed_limit:
			speed += speed_increase
	if Input.is_action_just_released("down"):
		input.y += 1
		velocity = input.normalized() * speed 
		speed = 0
		charged = true
	
	if charged == false:
		if move_right:
			input.x += 1
			speed = 200
		if move_left:
			input.x -= 1
			speed = 200
		if move_down:
			input.y += 1
			speed = 200
		if move_up:
			input.y -= 1
			speed = 200
		velocity = input.normalized() * speed
		
	
	
	
	if charged == true:
		if input.x == 0 && input.y == 0 && velocity.x > 0:
			velocity.x -= speed_increase
		elif input.x == 0 && input.y == 0 && velocity.x < 0:
			velocity.x += speed_increase
		if input.x == 0 && input.y == 0 && velocity.y < 0:
			velocity.y += speed_increase
		elif input.x == 0 && input.y == 0 && velocity.y > 0:
			velocity.y -= speed_increase
		if velocity.x == 0 && velocity.y == 0:
			charged = false
	
	
	
	
	move_and_slide()
