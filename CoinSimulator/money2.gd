extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var Text = Money.money
	self.text  = str(Text)
	
	
