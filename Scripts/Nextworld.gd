extends Node


var random = randi() % 7

func _ready():
	randomize()
	
	var files =  list_files_in_directory("res://maps")
	
	var random = randi() % files.size()
	
	
	

	
	
	
	
	get_tree().change_scene("res://maps/" + files[random])

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
