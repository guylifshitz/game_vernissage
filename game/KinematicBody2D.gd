extends KinematicBody2D


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

#func _physics_process(delta):
	#print(self.get_colliding_bodies())
