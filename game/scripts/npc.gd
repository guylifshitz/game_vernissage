extends KinematicBody2D

var wants_food = false
var wants_art = false
var wants_social = false

var art_to_want
var social_to_want
var food_to_want

var char_speed = 100

var change_timer = 1

var food_root

func _ready():
	food_root = get_tree().get_root().get_node("game/foods")
	change_function()

func _process(delta):
	change_timer = change_timer - delta
	if change_timer < 0:
		change_function()

	if wants_food:
		var food_children = food_root.get_children()
		if not food_exists():
			change_function()
			return 
		food_to_want = food_children[randi() % food_children.size()]
			
		var velocity = (food_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

	if wants_art:
		var velocity = (art_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

	if wants_social:
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
	wants_art = false
	wants_food = true
	wants_social = false

func want_art():
	wants_food = false
	wants_art = true
	wants_social = false

	var arts_root = get_tree().get_root().get_node("game/arts")
	var art_children = arts_root.get_children()
	art_to_want = art_children[randi() % art_children.size()]
	
func want_social():
	wants_food = false
	wants_art = false
	wants_social = true
	
	var social_root = get_tree().get_root().get_node("game/social_areas")
	var social_children = social_root.get_children()
	social_to_want = social_children[randi() % social_children.size()]

func food_exists():
	var food_children = food_root.get_children()
	return food_children.size() > 0
