extends Area2D

func init():
	self.connect("body_entered", self.get_parent(), "on_food_area_body_entered")
	self.connect("body_exited", self.get_parent(), "_on_food_area_body_exited")

