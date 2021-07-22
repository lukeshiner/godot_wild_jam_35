extends Control


onready var tree = $Tree


func defocus():
	print("Unfocus", name)
	tree.set_focus_mode(0)
	tree.set_process(false)
	release_focus()

func focus():
	print(tree.get_focus_mode())
	print("focus", name)
	tree.set_focus_mode(2)
	tree.grab_focus()
	tree.set_process(true)


func _on_FileSystemWindow_focus_entered():
	focus()


func _on_FileSystemWindow_focus_exited():
	defocus()
