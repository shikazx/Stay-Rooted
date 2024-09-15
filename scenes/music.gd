extends Control


func playMenu():
	$Menu.play()
	
func stopMenu():
	$Menu.stop()

func playGameMusic():
	$"inGame".play()
	
func stopGameMusic():
	$"inGame".stop()
	
func playSFX():
	$LevelUp.play()
	
func playLoseLife():
	$loseLife.play()
	
func playTreeBend():
	$treeBending.play()
	
