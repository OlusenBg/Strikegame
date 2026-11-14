extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var input := Vector2.ZERO
	if Input.is_action_pressed("right"): input.x += 1
	if Input.is_action_pressed("left"): input.x -= 1
	if Input.is_action_pressed("up"): input.y -= 1
	if Input.is_action_pressed("down"): input.y += 1
