extends Node2D

@onready var PLAYER = $Player
@onready var CAMERA = $Camera2D

func _process(delta: float) -> void:
	CAMERA.position.x = PLAYER.position.x
	CAMERA.position.y = PLAYER.position.y
