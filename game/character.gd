extends AnimatedSprite


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	if Input.is_key_pressed(KEY_DOWN):
		self.play("down");
	elif Input.is_key_pressed(KEY_UP):
		self.play("up");
		

	if Input.is_key_pressed(KEY_LEFT):
		self.play("left");
	elif Input.is_key_pressed(KEY_RIGHT):
		self.play("right");
		
#func _physics_process(delta):
	#print(self.get_colliding_bodies())
