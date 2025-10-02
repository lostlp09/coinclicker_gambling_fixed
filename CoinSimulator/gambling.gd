extends Node2D

@onready var textobject:Label = $Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(Money.money)
	Money.money  = 300
	
	var text =  Money.money
	textobject.text = str(text)
	


func _on_button_2_pressed() -> void:
	pass # Replace with function body.
