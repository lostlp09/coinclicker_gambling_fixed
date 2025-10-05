extends Button

@onready var Text:Label  = $"../Label"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.




func _on_pressed() -> void:
	
	Text.set_meta("amount",Text.get_meta("amount") + 10) 

	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	if Text.get_meta("amount") -10>=0:
		Text.set_meta("amount",Text.get_meta("amount") - 10) 
	pass


func _on_button_3_pressed() -> void:
	print(Money.money)
	print(Text.get_meta("amount"))
	Text.set_meta("amount",Money.money + 10) 
