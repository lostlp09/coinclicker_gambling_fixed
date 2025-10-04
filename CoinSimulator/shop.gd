extends Node
@onready  var ShopGui =  $ShopGUi
@onready  var onoffbutton = $Button
var acceleartion = 19.95

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if  onoffbutton.get_child(0).flip_h == false	:
		onoffbutton.get_child(0).flip_h = true
		close()
	else:
		print("hi")
		open()
		onoffbutton.get_child(0).flip_h = false
		
func open()-> void:
	var accelerationclone = acceleartion
	for i in range(1,22):
		acceleartion -= 0.95
		onoffbutton.position.x -= 1 * acceleartion
		ShopGui.position.x -= 1 * acceleartion
		if i == 21:
			acceleartion = accelerationclone
	
		await  get_tree().create_timer(0.01).timeout
		
func close()->void:
	var accelerationclone = acceleartion
	for i in range(1,22):
		acceleartion -= 0.95
		onoffbutton.position.x += 1 * acceleartion
		ShopGui.position.x += 1 * acceleartion

		if i == 21:
			acceleartion = accelerationclone
			
		await  get_tree().create_timer(0.01).timeout

	
	
		
		

	
