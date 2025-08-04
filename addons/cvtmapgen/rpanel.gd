@tool
extends Control

const CFG_PATH = "res://cvtm.json"
var cfg: Dictionary

var inputs: Dictionary = {
	"mapsources": null
}

func _on_save_pressed() -> void:
	save()

func _init() -> void:
	var file
	if FileAccess.file_exists(CFG_PATH):
		file = FileAccess.open(CFG_PATH, FileAccess.READ)
		cfg = JSON.parse_string(file.get_as_text())
	else:
		cfg = {}
		file = FileAccess.open(CFG_PATH, FileAccess.WRITE)
		file.store_string(JSON.stringify(cfg))
	file.close()
	child_entered_tree.connect(handle_child)

func assign_data(node: Node, data):
	if node is TextEdit:
		node.text = data

func handle_child(node: Node):
	if node.name in inputs.keys():
		inputs[node.name] = node
		
	if node.name in cfg.keys():
		if cfg[node.name]:
			assign_data(node, cfg[node.name])

func save() -> void:
	cfg["mapsources"] = inputs["mapsources"].text
	var file = FileAccess.open(CFG_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(cfg))


func _on_open_terminal() -> void:
	OS.execute("C:\\Program Files\\Git\\git-bash.exe", ["--cd-to-home"])
