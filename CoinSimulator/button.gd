extends Button

@onready var Text:Label  = $"../Label"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.




func _on_pressed() -> void:
	print("hi")
	
	Text.set_meta("amount",Text.get_meta("amount") + 10) 

	pass # Replace with function body.




func _on__pressed() -> void:
	if Text.get_meta("amount") -10>=0:
		Text.set_meta("amount",Text.get_meta("amount") - 10) 



func _on_all_in_pressed() -> void:
	Text.set_meta("amount",Money.money) 
