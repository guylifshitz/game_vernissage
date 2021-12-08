extends Node2D

var character_eating = false
var npc_eating_count = 0
var food_speed = 5

var food_score


func _ready():
	food_score = 100

func _process(delta):
	if character_eating:
		food_score = food_score - food_speed  * delta
	
	food_score = food_score - npc_eating_count * food_speed * delta
	
	$txt_food_score.text = String(int(food_score))

func _on_food_area_body_entered(body):
	if(body.name == "character"):
		character_eating = true
	if(body.name == "npc"):
		npc_eating_count = npc_eating_count + 1


func _on_food_area_body_exited(body):
	if(body.name == "character"):
		character_eating = false
	if(body.name == "npc"):
		npc_eating_count = npc_eating_count - 1
