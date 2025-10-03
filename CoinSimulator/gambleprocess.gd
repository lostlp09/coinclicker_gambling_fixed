extends Button

@onready var amounttextobject =$"../Label"
@onready var  allslots = $"../allslots"
var Gambling:bool = false
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


func _process(delta: float) -> void:
	if  Gambling == false:
		for i in allslots.get_children():
			i.position.y += 0.5
			if i.position.y >= -45 :
				var newclone = i.duplicate()
				if i.is_in_group("firstslot"):
					
					newclone.position = Vector2(-82.937,-438.563)
				
				elif  i.is_in_group("secondslot"):
					newclone.position = Vector2(0.0,-438.563)
					
				else:
					newclone.position = Vector2(81.063,-438.563)
				allslots.add_child(newclone)
				i.queue_free()
				


			
				
				

			
			
		
			
	
