extends CanvasLayer


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()
