extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("fade")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/death.tscn")
	
