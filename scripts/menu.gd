extends Control


func _ready() -> void:
	if Transition.fromOptions:
		Music.playMenu()

func _on_play_pressed() -> void:
	Transition.fromOptions = true;
	Transition.transition()
	await Transition.on_transition_finished
	Music.stopMenu()
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	

func _on_options_pressed() -> void:
	Transition.fromOptions = false;
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
