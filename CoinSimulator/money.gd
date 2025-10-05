extends Node



var save_file := "user://save_data.json"
var safestats = {"multy":1,"miner":0,"Autoclicker":0,"subgame":false}
var money  = 0


func savecoins():
	
	var file := FileAccess.open(save_file, FileAccess.WRITE)

	if file:
		var data= {"coins":money,"Otherstuff":safestats}
		var json = JSON.new()
		var json_string := json.stringify(data)
		
		file.store_string(json_string)
		file.close()
		print("worked")
	else:
		push_error("Error")
func loadcoins():
	if FileAccess.file_exists(save_file):
		var file := FileAccess.open(save_file,FileAccess.READ)
		if file:
			var json_text := file.get_as_text()
			var data = JSON.parse_string(json_text)
			if typeof(data) == TYPE_DICTIONARY:
				money = int(data.get("coins",0))
				safestats = data.get("Otherstuff", safestats)
			else:
				push_error("didnt worked")
			file.close()
	else:
		print("never played this game before")
		safestats = {"multy":1,"miner":0,"Autoclicker":0,"subgame":false}
		money  = 0

		
				
				
		
		
