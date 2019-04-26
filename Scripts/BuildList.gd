extends Control

var maps
var selecteditems
var chosenMapNames = []
var justPressed = false

func _ready():
	maps = list_files_in_directory("res://maps")
	
	for map in maps:
		$MapList.add_item(map)
	
	
	
	


func _process(delta):
	
	if $Button.pressed :
		selecteditems= $MapList.get_selected_items()
		for number in selecteditems:
				chosenMapNames.push_back($MapList.get_item_text(number))
		singleton.chosenMaps = chosenMapNames
		print(singleton.chosenMaps)
		
		singleton.wantRandonm = $WantRandom.pressed
		singleton.chosenMaps = serializeMaps()
		get_tree().change_scene("Nextworld.tscn")

	
	



func serializeMaps():
	var mapsTemp = []
	var files = []
	
	var final = []
	
	
	mapsTemp = singleton.chosenMaps
	for map in mapsTemp:
		files.append(list_files_in_directory("res://maps/"+ map))
		
	
	
	for i in range(files.size()):
				for h in range(files[i].size()):
					files[i][h] = mapsTemp[i] + "/" + files[i][h]
	
	for arrays in files:
		final += arrays
	return final



func list_files_in_directory(path):
    var files = []
    var dir = Directory.new()
    dir.open(path)
    dir.list_dir_begin()

    while true:
        var file = dir.get_next()
        if file == "":
            break
        elif not file.begins_with("."):
            files.append(file)

    dir.list_dir_end()

    return files
