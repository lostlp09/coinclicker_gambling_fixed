extends Node
@onready  var ShopGui =  $ShopGUi
@onready  var onoffbutton = $Button
@onready var minerbuttin = $ShopGUi/miner
@onready var autoclicker = $ShopGUi/Autoclicker
@onready var multybutton = $ShopGUi/multiplier
@onready var subgameplay = $ShopGUi/Gameplay
@onready var gameplaybutton = $ShopGUi/Gameplay
var finished = true
var acceleartion = 35
var timer = 0
var autoclickertimer = 0
@onready var videoplayer = $"../VideoStreamPlayer"

func _exit_tree() -> void:
	Money.savecoins()
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Money.loadcoins()
	
	if Money.safestats["Autoclicker"] == 0.5:
		autoclicker.get_child(1).text = "5k"
		autoclicker.text = "Upgrade2"
		
	elif Money.safestats["Autoclicker"] == 1:
		autoclicker.get_child(1).text = "1k"
		autoclicker.text = "Upgrade1"
	
	elif Money.safestats["Autoclicker"] == 0.25:
		autoclicker.text = "Upgrade3"
		autoclicker.get_child(1).text = "10k"
	elif Money.safestats["Autoclicker"] == 0.1:
		autoclicker.get_child(1).text = "Full"
		autoclicker.text = "Max"
	
	if Money.safestats["miner"] <= 5:
		if Money.safestats["miner"] == 0:
			pass
		else:
			minerbuttin.text = "Updrade" + str( int(Money.safestats["miner"]))
			if Money.safestats["miner"] == 1:
				minerbuttin.get_child(1).text = "500"
			elif Money.safestats["miner"] == 2:
				minerbuttin.get_child(1).text = "1k"
			elif  Money.safestats["miner"] == 3:
				minerbuttin.get_child(1).text = "5k"
			
			elif Money.safestats["miner"] == 4:
				minerbuttin.get_child(1).text = "10k"
			elif  Money.safestats["miner"] == 5:
				minerbuttin.get_child(1).text = "Full"
	else:
		minerbuttin.text = "Max"
	if Money.safestats["subgame"] == true:
		gameplaybutton.get_child(1).text = "Full"
		videoplayer.visible = true
		gameplaybutton.text = "Max"
	
	var text_for_multy = Money.safestats["multy"] * 500
	if text_for_multy >= 1000000:
			text_for_multy = str(text_for_multy/1000000) +"m"
	elif text_for_multy >= 1000:
		text_for_multy = str(text_for_multy/1000) +"k"
		multybutton.get_child(1).text = text_for_multy
		
		
		
	
	
		
	
	
	timer = 0
	autoclicker.pressed.connect(buyautoclicker)
	minerbuttin.pressed.connect(buyminer)
	multybutton.pressed.connect(buymulty)
	subgameplay.pressed.connect(buygameplay)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Money.safestats["Autoclicker"] >0:
		autoclickertimer += delta
		if autoclickertimer >= Money.safestats["Autoclicker"]:
			autoclickertimer = 0
			Money.money += 1 * Money.safestats["multy"]

	if Money.safestats["miner"] > 0:
		timer += delta
		if  timer >= 10:
			timer = 0
			for i in range(0,Money.safestats["miner"]):
				var randomnumber = randi_range(1,101)
				if randomnumber <= 50:
					Money.money += 1 * Money.safestats["multy"]
				elif randomnumber <= 75:
					Money.money += 10 * Money.safestats["multy"]
				elif randomnumber <= 100:
					Money.money += 100 *Money.safestats["multy"]
func _on_button_pressed() -> void:
	if  onoffbutton.get_child(0).flip_h == false	:
		onoffbutton.get_child(0).flip_h = true
		close()
	else:
		print("hi")
		open()
		onoffbutton.get_child(0).flip_h = false
		
func open()-> void:
	if finished:
		finished = false
		var accelerationclone = acceleartion
		for i in range(1,35):
			acceleartion -= 1
			onoffbutton.position.x -= 1 * acceleartion
			ShopGui.position.x -= 1 * acceleartion
			if i == 34:
				acceleartion = accelerationclone
	
			await  get_tree().create_timer(0.01).timeout
		finished = true	
		
func close()->void:
	if finished:
		finished = false
		var accelerationclone = acceleartion
		for i in range(1,35):
			acceleartion -= 1
			onoffbutton.position.x += 1 * acceleartion
			ShopGui.position.x += 1 * acceleartion

			if i == 34:
				acceleartion = accelerationclone
				
			await  get_tree().create_timer(0.01).timeout
		finished = true	
		
		
func buyminer() ->void:

	if Money.safestats["miner"] == 0 and Money.money >= 100:
		minerbuttin.text = "Upgrade1"
		Money.money -= 100
		minerbuttin.get_child(1).text =  "500"
		Money.safestats["miner"] = 1
	elif	Money.safestats["miner"] == 1 and Money.money >= 500:
		minerbuttin.text = "Upgrade2"
		Money.money -=  500
		minerbuttin.get_child(1).text =  "1k"
		Money.safestats["miner"] = 2
	elif Money.safestats["miner"] == 2 and Money.money >= 1000:
		minerbuttin.text = "Upgrade3"
		minerbuttin.get_child(1).text =  "5k"
		Money.money -=  1000
		Money.safestats["miner"] =3
		
	
	elif Money.safestats["miner"] == 3 and Money.money >= 5000:
		minerbuttin.text = "Upgrade4"
		Money.safestats["miner"] = 4
		Money.money -=  5000
		minerbuttin.get_child(1).text =  "10k"
		
	elif Money.safestats["miner"] == 4 and Money.money >= 10000:
		minerbuttin.text = "Max"
		Money.safestats["miner"] = 5
		Money.money -= 5000
		minerbuttin.get_child(1).text =  "full"
		
		
func buyautoclicker()->void:
	if Money.safestats["Autoclicker"] == 0 and Money.money >= 100:
		autoclicker.text = "Upgrade1"
		Money.money -= 100
		Money.safestats["Autoclicker"] = 1
		autoclicker.get_child(1).text = "1k"
		
	elif Money.safestats["Autoclicker"] == 1 and Money.money >= 1000:
		autoclicker.text = "Upgrade2"
		Money.money -= 1000
		Money.safestats["Autoclicker"] = 0.5
		autoclicker.get_child(1).text = "5k"
	elif Money.safestats["Autoclicker"] == 0.5 and Money.money >= 5000:
		autoclicker.text = "Upgrade3"
		Money.money -= 5000
		Money.safestats["Autoclicker"] = 0.25
		autoclicker.get_child(1).text = "10k"
	elif Money.safestats["Autoclicker"] == 0.25 and Money.money >= 10000:
		autoclicker.text = "Max"
		Money.money -= 10000
		Money.safestats["Autoclicker"] = 0.1
		autoclicker.get_child(1).text = "Full"
		
		
		
		
func buymulty()->void:
	
	if Money.money >= 500 * Money.safestats["multy"]:
		Money.money -= 500 * Money.safestats["multy"]
		if 	Money.safestats["multy"] == 1:
			Money.safestats["multy"] += 1
		else:
				Money.safestats["multy"] += 2
		var text_for_multy = Money.safestats["multy"] * 500
		if text_for_multy >= 1000000:
			text_for_multy = str(text_for_multy/1000000) +"m"
		elif text_for_multy >= 1000:
			text_for_multy = str(text_for_multy/1000) +"k"
		multybutton.get_child(1).text = text_for_multy
		
			
		
	
		multybutton.text = str(500 * Money.safestats["multy"])
				
func buygameplay()->void:
	if Money.safestats["subgame"] == false and Money.money >= 1000:
		Money.safestats["subgame"] = true
		subgameplay.get_child(1).text = "Full"
		subgameplay.text = "Max"
		videoplayer.visible = true	
		Money.money -= 1000
		
	
	
			
	
		
	

	
	
	
		
		

	
