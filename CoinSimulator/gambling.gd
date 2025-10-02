extends Node2D
@onready var amount = $Label


func _process(delta: float) -> void:
	amount.text = "amount: " + str(amount.get_meta("amount"))




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
