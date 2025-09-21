extends Node

@onready var pause_panel: Panel = %Pause_panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("Pause")
	if esc_pressed:
		get_tree().paused = true
		pause_panel.show()


func _on_play_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()



func _on_restart_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()
	get_tree().reload_current_scene()

func _on_home_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
