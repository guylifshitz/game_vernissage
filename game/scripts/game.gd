extends Node2D

func _ready():
	var food_prefab = load("res://prefabs/food.tscn")
	
	for spawn_point in $foods/spawn_points.get_children():
		var new_food = food_prefab.instance()
		$foods/foods.add_child(new_food)
		new_food.get_node("food_area").init()
		new_food.position = spawn_point.position


func _process(delta):
	pass
