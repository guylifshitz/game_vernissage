extends KinematicBody2D

var food_score = 0
var art_score = 0
var social_score = 0

var npcs_in_area = 0

var attack_timer = 0

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var velocity = 100;

	if Input.is_key_pressed(KEY_SHIFT):
		velocity = 500;

	var y_speed = 0;
	var x_speed = 0;

	if Input.is_key_pressed(KEY_DOWN):
		y_speed = velocity;
	elif Input.is_key_pressed(KEY_UP):
		y_speed = -velocity;

	if Input.is_key_pressed(KEY_LEFT):
		x_speed = -velocity;
	elif Input.is_key_pressed(KEY_RIGHT):
		x_speed = velocity;

	self.move_and_slide(Vector2(x_speed, y_speed));

	if npcs_in_area > 0:
		if Input.is_action_just_pressed("action"):
			self.social_score += npcs_in_area
			refresh_social_score_text()
			$dialogbox.show()

			var random_sentences = ["blah blah", "yada yada", "wowaz", "blah blah, yada", "wozaos"]
			$dialogbox/dialog_text.text = random_sentences[randi() % random_sentences.size()]
			attack_timer = 1

	attack_timer -= delta 

	if attack_timer < 0:
		attack_timer = 0
		$dialogbox.hide()	
		
#func _physics_process(delta):
	#print(self.get_colliding_bodies())


func _on_Area2D_body_entered(body):
	if body.get_parent().name == "npcs":
		npcs_in_area += 1

func _on_Area2D_body_exited(body):
	if body.get_parent().name == "npcs":
		npcs_in_area -= 1

func refresh_social_score_text():
	var social_score_text = get_tree().get_root().get_node("game/overlays/social_score")
	social_score_text.text = "social: " + String(social_score)
