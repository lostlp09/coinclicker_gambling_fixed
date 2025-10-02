extends Button

@onready var amounttextobject =$"../Label"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(gamblingactivated)
	
func gamblingactivated() -> void:
	if Money.money >= amounttextobject.get_meta("amount"):
		var amountyouwetted = amounttextobject.get_meta("amount")
		var randomzahl = randi_range(1,100)
		
	
		if randomzahl <= 50:
			print("you lose")
			Money.money-= amountyouwetted
		elif randomzahl <= 70:
			print("you lost half of the amount")
			Money.money-= amountyouwetted/2
		elif randomzahl <= 90:
			print("you got a solid jackpot")
			Money.money+= amountyouwetted/2
		else:
			Money.money+= amountyouwetted
			print("you won the jackpot")
			
			
			
		
			
	
