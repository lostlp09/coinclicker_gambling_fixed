extends Button
const  cherry= -260.0
const  Bomb = -180.0
const pixel = -110.0
@onready var amounttextobject =$"../Label"
@onready var  allslots = $"../allslots"
var Gambling:bool = false
var pickedfirstsecondthird =0
var yourposition=null
var done  = 0
const  resetpoint = -40
const  maxhight = -440.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(gamblingactivated)
	
func gamblingactivated() -> void:
	var positionforslots = [cherry,Bomb,pixel]


	
	if Money.money >= amounttextobject.get_meta("amount") and Gambling == false:
		var spinlength  =randi_range(1,3) 

		var slotspcitures = []
		slotspcitures = allslots.get_children()
		Gambling = true
		var amountyouwetted = amounttextobject.get_meta("amount")
		var randomzahl = randi_range(1,100)
		if randomzahl <= 50:
			
			print("you lose")
			Money.money-= amountyouwetted
			print(positionforslots)
		elif randomzahl <= 70:
			var clonelist = positionforslots.duplicate()
			var clone  =clonelist.pick_random()
			positionforslots[0] = clone
			clonelist.erase(clone)
			positionforslots[1] = clone
			clonelist.erase(clone)
			positionforslots[2] = clonelist[0]
			print("you lost half of the amount")
			Money.money-= amountyouwetted/2
		elif randomzahl <= 90:
			var randomnumber = randi_range(0,1)
			if randomnumber == 0:
				positionforslots = [cherry,cherry,cherry]
			else:
				positionforslots = [Bomb,Bomb,Bomb]
			Money.money+= amountyouwetted/2
		else:
			positionforslots = [pixel,pixel,pixel]		
																	
			Money.money+= amountyouwetted
			print("you won the jackpot")
		var current = 0
		while Gambling:
			for i in slotspcitures:
				if i.is_in_group("firstslot") and pickedfirstsecondthird <= 1:
					i.position.y += 10
				elif  i.is_in_group("secondslot") and pickedfirstsecondthird <= 3:
						i.position.y += 10
				elif i.is_in_group("thirdslot") and pickedfirstsecondthird <= 5:
						i.position.y += 10
				
				if pickedfirstsecondthird== 1 and i.is_in_group("firstslot"):
					if yourposition ==null:
						yourposition = positionforslots.pick_random()
						positionforslots.erase(yourposition)
					if i.position.y >= yourposition:
						var Name = i.name
						if Name =="First":
							for object in slotspcitures:
								if object.name == "First2":
									
									object.position.y += 10
									if object.position.y >= resetpoint:
										print("1")
										object.position =  Vector2(-88.0,resetpoint)
									break
				
									
#----------------------------------------------------------------------------------------
						current = 0
						pickedfirstsecondthird = 2
						yourposition = null
						done = 1
						
				if pickedfirstsecondthird == 3 and i.is_in_group("secondslot"):
			
					if yourposition == null:
						yourposition = positionforslots.pick_random()
						positionforslots.erase(yourposition)
						
					if i.position.y >= yourposition:
						var Name = i.name
					
						pickedfirstsecondthird = 4
						yourposition = null
						current = 0
						done = 2
		
						if Name =="second":
							for object in slotspcitures:
								if object.name == "second2":
									object.position.y += 10
									if object.position.y >= resetpoint:
										print("2")
										object.position =  Vector2(-5.75,resetpoint)

									break
#----------------------------------------------------------------------------------------
				if pickedfirstsecondthird == 5 and i.is_in_group("thirdslot"):
					if yourposition == null:
						yourposition = positionforslots.pick_random()
						positionforslots.erase(yourposition)
					
					
					if i.position.y >= yourposition:
						var Name = i.name
						pickedfirstsecondthird = 6
						current = 0
						done = 3
						Gambling = false
						if Name =="third":
							for object in slotspcitures:
								if object.name == "third2":
									object.position.y += 10
									if object.position.y >= resetpoint:
										print("3")
										object.position =  Vector2(76.0,maxhight)
										
									break
				if i.position.y >= resetpoint:
					
					if i.is_in_group("firstslot") and pickedfirstsecondthird <= 1:
						if current !=  spinlength:
							current += 1
						if current == spinlength:
							pickedfirstsecondthird = 1
						i.position = Vector2(-83.0,maxhight)
					
					elif  i.is_in_group("secondslot") and pickedfirstsecondthird <= 3:
						
						if done == 1:	
					
							if current !=  spinlength:
								current += 1
							if current == spinlength:
								pickedfirstsecondthird = 3
						i.position = Vector2(-5.75,maxhight)
						
					elif i.is_in_group("thirdslot") and pickedfirstsecondthird <= 5:
						
						if done == 2:	
					
							if current !=  spinlength:
								current += 1
							if current == spinlength:
								pickedfirstsecondthird = 5
						i.position = Vector2(76.0,maxhight )
			if Gambling == false:
				
				done = 0
				pickedfirstsecondthird = 0
				yourposition = null
				current = 0
			await get_tree().create_timer(0.01).timeout
			
		




	

	
				


			
				
				
		
			
			
		
			
	
