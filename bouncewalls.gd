extends Area2D

@export var left_tilted = false
@export var right_tilted = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		
		if left_tilted:
			if body.velocity.x != 0:
				body.velocity.y = body.velocity.x
				body.velocity.x = 0
			
			elif body.velocity.y != 0:
				body.velocity.x = body.velocity.y
				body.velocity.y = 0
			
		elif right_tilted:
			if body.velocity.x != 0:
				body.velocity.y -= body.velocity.x
				body.velocity.x = 0
			
			elif body.velocity.y != 0:
				body.velocity.x -= body.velocity.y
				body.velocity.y = 0
			
		else:
			body.velocity *= -1
		
