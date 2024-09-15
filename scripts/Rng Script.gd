extends Node

var arrayRNG: Array[String] = ["W", "A", "S", "D"]
var result = arrayRNG.pick_random()
var counter = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		match result:
			"W":
				if event.keycode == KEY_W:
					print("W was pressed")
					counter += 1
					print(counter)
			"A":
				if event.keycode == KEY_A:
					print("A was pressed")
					counter += 1
					print(counter)
			"S":
				if event.keycode == KEY_S:
					print("S was pressed")
					counter += 1
					print(counter)
			"D":
				if event.keycode == KEY_D:
					print("D was pressed")
					counter += 1
					print(counter)

func eraseKey():
	print(result + " Will be removed")
	arrayRNG.erase(result)

func _ready():
	set_process_input(true) 
	eraseKey()
	
