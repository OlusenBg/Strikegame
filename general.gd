extends Node2D

@onready var PLAYER = $Player
@onready var CAMERA = $Camera2D

func _ready() -> void:
	$Camera2D/You_lost_screen.hide()
	$Camera2D/You_win_screen.hide()
	$Backround.show()

func _process(delta: float) -> void:
	CAMERA.position.x = PLAYER.position.x
	CAMERA.position.y = PLAYER.position.y
	
	if $Player.dead == true:
		await get_tree().create_timer(1.5).timeout
		$Camera2D/You_lost_screen.show()
		
		get_tree().paused = true
	
	if $Player.level == 1:
		PLAYER.global_position = $Level_1/spawn1.global_position
		$Player.level = 1.5
		
	elif $Player.level == 2:
		await get_tree().create_timer(0.5).timeout
		$Camera2D/You_win_screen.show()
		get_tree().paused = true



func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_music_finished() -> void:
	$MainMusic.play()
