extends Node2D

@onready var PLAYER = $Player
@onready var CAMERA = $Camera2D
@onready var SPEED_DISPLAY = $Camera2D/Speed_display

func _ready() -> void:
	SPEED_DISPLAY.show()
	$Camera2D/You_lost_screen.hide()

func _process(delta: float) -> void:
	CAMERA.position.x = PLAYER.position.x
	CAMERA.position.y = PLAYER.position.y
	
	SPEED_DISPLAY.text = "Speed: " + str($Player.speed/100)
	if $Player.dead == true:
		SPEED_DISPLAY.hide()
		await get_tree().create_timer(1.5).timeout
		$Camera2D/You_lost_screen.show()
		
		get_tree().paused = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
