extends Node2D
@onready var coinsound = $TextureButton/AudioStreamPlayer2D


@onready var coin =$TextureButton
# Called when the node enters the scene tree for the first time
@onready var label:Label = $Coin
func _ready() -> void:
	
	
	label.text = str(Money.money)
	coin.pressed.connect(oncoinpressed)
	

func oncoinpressed() -> void:
	var clone = coinsound.duplicate()
	self.add_child(clone)
	clone.play()
	
	var effect:Sprite2D=  $TextureButton/Sprite2D
	
	
	effect = effect.duplicate()
	self.add_child(effect)
	effect.visible = true
	effect.scale = Vector2(0.05,0.05)
	

	effectfunc(effect)
	
	
	Money.money+= 1 * Money.safestats["multy"]

	
	
	


func effectfunc(effectparticle) -> void:
	var y = randi_range(-200,400)
	var x = randi_range(-300,400)
	effectparticle.position = Vector2(x,y)
	print(x)
	
	
	
	for i in range(0,100):

		effectparticle.scale += Vector2(0.001,0.001)
		
		await get_tree().create_timer(0.01).timeout
	effectparticle.queue_free()
	
	


	


func _on_button_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Gambling.tscn")

func  _process(delta: float) -> void:
	for i in self.get_children():
		if i is AudioStreamPlayer2D:
			if i.playing == false:
				i.queue_free()
		
	
