extends Node2D

@onready var PLAYER = $Player
@onready var CAMERA = $Camera2D
@onready var SPEED_DISPLAY = $Camera2D/Speed_display

func _process(delta: float) -> void:
	CAMERA.position.x = PLAYER.position.x
	CAMERA.position.y = PLAYER.position.y
	
	SPEED_DISPLAY.text = "Speed: " + str($Player.speed/100)
