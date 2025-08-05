@tool
extends EditorPlugin

var rpanel = preload("res://addons/cvtmapgen/rpanel.tscn")
var rpanel_inst: Control

func _enter_tree() -> void:
	rpanel_inst = rpanel.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, rpanel_inst)


func _exit_tree() -> void:
	#rpanel_inst.save()
	remove_control_from_docks(rpanel_inst)
	rpanel_inst.queue_free()
