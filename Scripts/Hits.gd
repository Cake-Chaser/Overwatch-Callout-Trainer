extends Node

var All_btn
var Find_lbl
var The_Goal
var random 
const numbers = [1,2,3,4,5,6,7,8,9,0]
var time = singleton.RunTime

func _ready():
	
	Find_lbl = get_node("../Find_lbl")
	All_btn = get_children()
	
	RandomeCallout()
	
	
	for	btn in All_btn:
		print(btn.name)
	print(Find_lbl.name)
	print(random)
	
	
	


func RandomeCallout():
	randomize()
	if All_btn.size() == 0:
		get_tree().change_scene("Nextworld.tscn")
		singleton.RunTime = time
		return 
	random = randi() % All_btn.size()
	The_Goal = All_btn[random].name
	Find_lbl.set_text("Find " + The_Goal )
	for number in numbers:
			if str(number) in The_Goal:
				The_Goal = The_Goal.replace(number, "")
				Find_lbl.set_text("Find " + The_Goal )


func _process(delta):
	
	time = time + delta
	
	
	for btn in All_btn:
		
		if btn.pressed and The_Goal in str(btn.name) :
			print(btn.name)
			btn.visible = false
			if All_btn.size() != 0:
				All_btn.remove(All_btn.find(btn));
			RandomeCallout()
	
	
	