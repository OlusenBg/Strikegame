extends CharacterBody2D

@export var speed_increase = 75
@export var speed: float = 0
@export var speed_limit = 3000
var charged = false
var dead = false
@export var level = 0.5

func _ready() -> void:
	level = 0.5
	dead = false
	

func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO
	
	
	
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
	
	if dead:
		velocity.x = 0
		velocity.y = 0
	
	
	move_and_slide()
