extends Node2D

@onready var label = $Label
@onready var timer = $Timer
@onready var total_time : int = 0 
@onready var fromOptions = true

var previous_score: int 

func _ready():
	$Timer.start()
	

func _on_timer_timeout():
	total_time += 1
	ScoreTrack.current_score = total_time
	
	previous_score = ScoreTrack.current_score
	if ScoreTrack.current_score > ScoreTrack.high_score:
		ScoreTrack.high_score = ScoreTrack.current_score
	
	$Label.text = "Your score is " + str(ScoreTrack.current_score) 
	$Label2.text = "Your highest score is: " + str(ScoreTrack.high_score)
