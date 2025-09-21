extends Area2D



func _on_body_entered(_body: Node2D) -> void:
	if self.name == "Mana_button":
		GlobalVals.platform1_triggered = true
	elif self.name == "Mana_button2":
		GlobalVals.platform2_triggered = true
	elif self.name == "Mana_button3":
		GlobalVals.platform3_triggered = true
	queue_free()
