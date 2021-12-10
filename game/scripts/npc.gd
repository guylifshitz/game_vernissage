extends KinematicBody2D

var wants

var art_to_want
var social_to_want
var food_to_want

var char_speed = 100

var change_timer = 1

var food_root

func _ready():
	food_root = get_tree().get_root().get_node("game/foods/foods")
	change_function()

func _process(delta):
	print(wants)
	change_timer = change_timer - delta
	if change_timer < 0:
		change_function()

	if wants == "food":
		var food_children = food_root.get_children()
		if not food_exists():
			change_function()
			return 
		food_to_want = food_children[randi() % food_children.size()]
			
		var velocity = (food_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

	if wants == "art":
		var velocity = (art_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

	if wants == "social":
		var velocity = (social_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

func change_function():
	# TODO change this to a timer
	change_timer = rand_range(2, 15)

	randomize()
	var new_state = randi() % 3

	if new_state == 0:
		want_art()
	if new_state == 1:
		want_food()
	if new_state == 2:
		want_social()

func want_food():
	wants = "food"

func want_art():
	wants = "art"

	var arts_root = get_tree().get_root().get_node("game/arts")
	var art_children = arts_root.get_children()
	art_to_want = art_children[randi() % art_children.size()]
	
func want_social():
	wants = "social"
	
	var social_root = get_tree().get_root().get_node("game/social_areas")
	var social_children = social_root.get_children()
	social_to_want = social_children[randi() % social_children.size()]

func food_exists():
	var food_children = food_root.get_children()
	return food_children.size() > 0
