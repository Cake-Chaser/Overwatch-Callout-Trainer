extends Control

var maps
var selecteditems
var chosenMapNames = []
var justPressed = false

const FORMAT_HOURS   = 1 << 0 
const FORMAT_MINUTES = 1 << 1
const FORMAT_SECONDS = 1 << 2 
const FORMAT_DEFAULT = FORMAT_HOURS | FORMAT_MINUTES | FORMAT_SECONDS



func _ready():
	maps = list_files_in_directory("res://maps")
	
	for map in maps:
		$MapList.add_item(map)
	
	
	$Label3/LastRunTime_lbl.text = format_time( singleton.RunTime , FORMAT_MINUTES | FORMAT_SECONDS) 
	

	






func format_time(time, format = FORMAT_DEFAULT, digit_format = "%02d"):
    var digits = []

    if format & FORMAT_HOURS:
        var hours = digit_format % [time / 3600]
        digits.append(hours)

    if format & FORMAT_MINUTES:
        var minutes = digit_format % [time / 60]
        digits.append(minutes)

    if format & FORMAT_SECONDS:
        var seconds = digit_format % [int(ceil(time)) % 60]
        digits.append(seconds)

    var formatted = String()
    var colon = " : "

    for digit in digits:
        formatted += digit + colon

    if not formatted.empty():
        formatted = formatted.rstrip(colon)

    return formatted







func _process(delta):
	
	if $Start_btn.pressed :
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
