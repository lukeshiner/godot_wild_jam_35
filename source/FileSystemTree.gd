extends Tree


func _ready():
	set_columns(3)
	var root = create_item()
	root.set_text(0, "Interface 42D")
	var files = create_item(root)
	var commands = create_item(root)
	var text_file = create_item(files)
	files.set_text(0, "/")
	commands.set_text(0, "Executables")
	text_file.set_text(0, "Log.txt")
#	text_file.add_button(0, "file.txt")
	var open_door = create_item(commands)
	open_door.set_text(0, "Open Door A12")
