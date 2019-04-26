extends Node
var random 
var mapstemp = []

func _ready():
	
	if singleton.wantRandonm == true:
		
		randomize()
		if singleton.chosenMaps.size() == 0:
			get_tree().change_scene("res://Menu.tscn")
			return
		random = randi() % singleton.chosenMaps.size()
		mapstemp = singleton.chosenMaps
		
		get_tree().change_scene("res://maps/" + mapstemp[random] )
		mapstemp.remove(random)
		singleton.chosenMaps = mapstemp
		
	else:
		if singleton.chosenMaps.size() == 0:
			get_tree().change_scene("res://Menu.tscn")
			return
		mapstemp = singleton.chosenMaps
		
		get_tree().change_scene("res://maps/" + mapstemp[0] )
		mapstemp.remove(0)
		singleton.chosenMaps = mapstemp




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
