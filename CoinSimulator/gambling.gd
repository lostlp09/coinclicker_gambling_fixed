extends  Node2D
@onready var label= $Label
func _process(delta: float) -> void:
	label.text = str(label.get_meta("amount"))
	

	
	
