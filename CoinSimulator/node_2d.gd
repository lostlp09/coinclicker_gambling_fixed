extends Node2D

@onready var coin =$TextureButton
# Called when the node enters the scene tree for the first time
@onready var label:Label = $Coin
func _ready() -> void:
	coin.pressed.connect(oncoinpressed)

func oncoinpressed() -> void:
	var effect:Sprite2D=  $TextureButton/Sprite2D
	
	effect = effect.duplicate()
	self.add_child(effect)
	effect.visible = true
	effect.scale = Vector2(0.05,0.05)
	

	effectfunc(effect)
	
	
	Money.money+= 1 * coin.get_meta("money")
	
	var text = Money.money
	
	label.text = str(text)
	
	


func effectfunc(effectparticle) -> void:
	var y = randi_range(-200,400)
	var x = randi_range(-300,400)
	effectparticle.position = Vector2(x,y)
	print(x)
	
	
	
	for i in range(0,100):

		effectparticle.scale += Vector2(0.001,0.001)
		
		await get_tree().create_timer(0.01).timeout
	effectparticle.queue_free()
	
	


	
