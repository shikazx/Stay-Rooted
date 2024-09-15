extends Control


func _ready() -> void:
	print(ScoreTrack.high_score)
	$"High Score".set_text("HIGH SCORE: %d" % ScoreTrack.high_score)
	$"Current Sore".set_text("Score: %d" % ScoreTrack.current_score)
func _on_menu_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/menu.tscn")



func _on_retry_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/world.tscn")
