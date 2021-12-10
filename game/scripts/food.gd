extends Node2D

var character_eating = false
var npc_eating_count = 0
var food_speed = 5

var food_quantity


func _ready():
	food_quantity = 10

func _process(delta):
	if character_eating:
		food_quantity = food_quantity - food_speed  * delta
		var character = get_tree().get_root().get_node("game/character/")
		character.food_score = character.food_score + 1
		var food_score_text = get_tree().get_root().get_node("game/overlays/food_score")
		food_score_text.text = "food: " + String(character.food_score)

	food_quantity = food_quantity - npc_eating_count * food_speed * delta

	if food_quantity < 0:
		self.get_parent().remove_child(self)

	$txt_food_score.text = String(int(food_quantity))

func _on_food_area_body_entered(body):
	if(body.name == "character"):
		character_eating = true
	if(body.get_parent().name == "npcs"):
		npc_eating_count = npc_eating_count + 1


func _on_food_area_body_exited(body):
	if(body.name == "character"):
		character_eating = false
	if(body.name == "npc"):
		npc_eating_count = npc_eating_count - 1
