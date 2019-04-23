extends Node

var All_btn
var info_lbl
var The_Goal
var random 
const numbers = [1,2,3,4,5,6,7,8,9,0]


func _ready():
	
	info_lbl = get_node("../Find_lbl")
	All_btn = get_children()
	
	RandomeCallout()
	
	
#	random = randi() % All_btn.size()
#	The_Goal = All_btn[random].name
#
#	info_lbl.set_text("Find " + The_Goal )
	
#	for debug
	for	btn in All_btn:
		print(btn.name)
	print(info_lbl.name)
	print(random)
	
	
	


func RandomeCallout():
	randomize()
	if All_btn.size() == 0:
		get_tree().change_scene("Nextworld.tscn")
		return 
	random = randi() % All_btn.size()
	The_Goal = All_btn[random].name
	info_lbl.set_text("Find " + The_Goal )
	for number in numbers:
			if str(number) in The_Goal:
				The_Goal = The_Goal.replace(number, "")
				info_lbl.set_text("Find " + The_Goal )


func _process(delta):
	
	
	
	
	for btn in All_btn:
		
		if btn.pressed and The_Goal in str(btn.name) :
			print(btn.name)
			btn.visible = false
			if All_btn.size() != 0:
				All_btn.remove(All_btn.find(btn));
			RandomeCallout()
	
	
	