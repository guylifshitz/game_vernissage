extends KinematicBody2D

var wants_food = false
var wants_art = false
var art_to_want
var wants_social
var char_speed = 100

var change_timer = 0

func _ready():
	want_art()

func _process(delta):
	print(change_timer)
	change_timer = change_timer - delta
	if change_timer < 0:
		change_function()

	if wants_food:
		var food_root = get_tree().get_root().get_node("game/foods")
		var food_children = food_root.get_children()
		var food_to_find = food_children[0]
			
		var velocity = (food_to_find.position - self.position).normalized() * char_speed;
		print(velocity)
		self.move_and_slide(velocity)

	if wants_art:
		print(art_to_want)
		var velocity = (art_to_want.position - self.position).normalized() * char_speed;
		self.move_and_slide(velocity)

func change_function():
	# TODO change this to a timer
	change_timer = rand_range(3, 15)

	var new_state = randi() % 2

	if new_state == 0:
		want_art()
	if new_state == 1:
		want_food()

func want_food():
	wants_art = false
	wants_food = true
	

func want_art():
	wants_food = false
	wants_art = true
	var arts_root = get_tree().get_root().get_node("game/arts")
	var art_children = arts_root.get_children()

	art_to_want = art_children[randi() % art_children.size()]
	
