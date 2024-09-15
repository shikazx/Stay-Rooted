extends ProgressBar


var rng = RandomNumberGenerator.new()
var arrayRNG: Array[String] = ["W", "A", "S", "D", "Space"]
var result = arrayRNG.pick_random()
var newKey = arrayRNG.pick_random()
@onready var time = $Timer
@onready var healthLost : int = 0
@onready var total_time : int = 0
var currentHealth: int = 4
var stormChecker: int = rng.randf_range(1, 10)

var level: int = 1


func _on_timer_timeout(): 
		total_time += 1 # Score 
		healthLost = log(level + 1) * 2 #How much hp u lose per second 
		value -= healthLost
		if total_time >= 60 && level == 1:
			healthLost += 100

func newProgress():
	if value == max_value:
		Music.playSFX()
		if stormChecker == 7:
			stormEvent()
			stormChecker = rng.randf_range(1, 10)
		else:
			level += 1
			$Tree.animation = "Idle"
			max_value += log(level + 3) * 5
			print(max_value)
			hideButtons()
			value = max_value/2
			result = arrayRNG.pick_random()
			unlockedKeys()
			stormChecker = rng.randf_range(1, 10)

func stormEvent():
	Music.playTreeBend()
	$Tree.animation = "Storm"
	max_value += max_value * 1.5
	level += 10
	hideButtons()
	value = max_value/2
	unlockedKeys()
	stormChecker = rng.randf_range(1, 10)
	result = arrayRNG.pick_random()

func unlockedKeys():
	if level >= 15:
		newKey = arrayRNG.pick_random()
		if newKey == result:
			newKey = arrayRNG.pick_random()
			time.wait_time = 0.10


func mashing(): # function so u can spam keys (FIRST ONE)
		match result:
			"W":
				if Input.is_action_just_pressed("pressW"):
					if $Buttons/CoconutButtonW1Key.frame == 0:
						$Buttons/CoconutButtonW1Key.frame = 1
					else:
						$Buttons/CoconutButtonW1Key.frame = 0
					value += (log(level+5)*10)/log(10)
					#print(value + (log(level+50)*5)/log(7))
			"A":
				if Input.is_action_just_pressed("pressA"):
					if $Buttons/CoconutButtonA1Key.frame == 0:
						$Buttons/CoconutButtonA1Key.frame = 1
					else:
						$Buttons/CoconutButtonA1Key.frame = 0
					value += (log(level+5)*10)/log(10)
					#print(value + (log(level+50)*5)/log(7))
			"S":
				if Input.is_action_just_pressed("pressS"):
					if $Buttons/CoconutButtonS1Key.frame == 0:
						$Buttons/CoconutButtonS1Key.frame = 1
					else:
						$Buttons/CoconutButtonS1Key.frame = 0
					value += (log(level+5)*10)/log(10)
					#print(value + (log(level+50)*5)/log(7))
			"D":
				if Input.is_action_just_pressed("pressD"):
					if $Buttons/CoconutButtonD1Key.frame == 0:
						$Buttons/CoconutButtonD1Key.frame = 1
					else:
						$Buttons/CoconutButtonD1Key.frame = 0
					value += (log(level+5)*10)/log(10)
					#print(value + (log(level+50)*5)/log(7))
			"Space":
				if Input.is_action_just_pressed("pressSpace"):
					if $Buttons/CoconutButtonSpace1Key.frame == 0:
						$Buttons/CoconutButtonSpace1Key.frame = 1
					else:
						$Buttons/CoconutButtonSpace1Key.frame = 0
					value += (log(level+5)*10)/log(10)
					#print(value + (log(level+50)*5)/log(7))

func newkeyMashing(): # function so u can spam keys (SECOND ONE THAT UNLOCKS AFTER newProgress())
	if level >= 15:
		match newKey:
			"W":
				if Input.is_action_just_pressed("pressW"):
					if $MultiButton/CoconutButtonW2Key.frame == 0:
						$MultiButton/CoconutButtonW2Key.frame = 1
					else:
						$MultiButton/CoconutButtonW2Key.frame = 0
					value += (log(level+5)*10)/log(10)
			"A":
				if Input.is_action_just_pressed("pressA"):
					if $MultiButton/CoconutButtonA2Key.frame == 0:
						$MultiButton/CoconutButtonA2Key.frame = 1
					else:
						$MultiButton/CoconutButtonA2Key.frame = 0
					value += (log(level+5)*10)/log(10)
			"S":
				if Input.is_action_just_pressed("pressS"):
					if $MultiButton/CoconutButtonS2Key.frame == 0:
						$MultiButton/CoconutButtonS2Key.frame = 1
					else:
						$MultiButton/CoconutButtonS2Key.frame = 0
					value += (log(level+5)*10)/log(10)
			"D":
				if Input.is_action_just_pressed("pressD"):
					if $MultiButton/CoconutButtonD2Key.frame == 0:
						$MultiButton/CoconutButtonD2Key.frame = 1
					else:
						$MultiButton/CoconutButtonD2Key.frame = 0
					value += (log(level+5)*10)/log(10)
			"Space":
				if Input.is_action_just_pressed("pressSpace"):
					if $MultiButton/CoconutButtonSpace2Key.frame == 0:
						$MultiButton/CoconutButtonSpace2Key.frame = 1
					else:
						$MultiButton/CoconutButtonSpace2Key.frame = 0
					value += (log(level+5)*10)/log(10)
						

func health(): # Health Function
	if value == 0:
		currentHealth -= 1
		value = max_value/2
		Music.playLoseLife()
	

func updateHealth():
	match currentHealth:
		3:
			$Coconut/CoconutLife4.frame = 1
		2:
			$Coconut/CoconutLife3.frame = 1
		1:
			$Coconut/CoconutLife2.frame = 1
		0: 
			queue_free()
			Music.stopGameMusic()
			get_tree().change_scene_to_file("res://scenes/deathTransition.tscn")

func hideButtons(): #Hides All Buttons Called in the Level up function
			$Buttons/CoconutButtonW1Key.hide()
			$Buttons/CoconutButtonA1Key.hide()
			$Buttons/CoconutButtonS1Key.hide()
			$Buttons/CoconutButtonD1Key.hide()
			$Buttons/CoconutButtonSpace1Key.hide()
			$MultiButton/CoconutButtonW2Key.hide()
			$MultiButton/CoconutButtonA2Key.hide()
			$MultiButton/CoconutButtonS2Key.hide()
			$MultiButton/CoconutButtonD2Key.hide()
			$MultiButton/CoconutButtonSpace2Key.hide()

func showButtons(): #Show's All First Key Buttons 
	match result:
		"W":
			$Buttons/CoconutButtonW1Key.show()
		"A":
			$Buttons/CoconutButtonA1Key.show()
		"S":
			$Buttons/CoconutButtonS1Key.show()
		"D":
			$Buttons/CoconutButtonD1Key.show()
		"Space":
			$Buttons/CoconutButtonSpace1Key.show()
			
			
func showMultiButtons(): #Show's All Second Key Buttons 
	if level >= 15:
		match newKey:
			"W":
				$MultiButton/CoconutButtonW2Key.show()
			"A":
				$MultiButton/CoconutButtonA2Key.show()
			"S":
				$MultiButton/CoconutButtonS2Key.show()
			"D":
				$MultiButton/CoconutButtonD2Key.show()
			"Space":
				$MultiButton/CoconutButtonSpace2Key.show()
				
				

func _input(event):
	mashing()
	newkeyMashing()
	
	
func _ready():
	Music.playGameMusic()
	value = max_value / 2 # Starting HP
	hideButtons()
	$Timer.start()
	set_process_input(true) 

func _process(delta):
	health()
	updateHealth()
	showButtons()
	showMultiButtons()
	newProgress()
