extends Node2D

func _ready():
	pass

func _process(delta):
	var food_prefab = load("res://prefabs/food.tscn")
	var new_food = food_prefab.instance()
	self.add_child(new_food)
	new_food.position = Vector2(400, 400)

	var new_food2 = food_prefab.instance()
	self.add_child(new_food2)
	new_food2.position = Vector2(600, 400)
