extends Node2D

var character_arting = false

func _ready():
	pass

func _process(delta):
	if character_arting:
		var character = get_tree().get_root().get_node("game/character/")
		character.art_score = character.art_score + 1
		var art_score_text = get_tree().get_root().get_node("game/overlays/art_score")
		art_score_text.text = "art: " + String(character.art_score)
		

func _on_art_body_entered(body):
	if(body.name == "character"):
		character_arting = true

func _on_art_body_exited(body):
	if(body.name == "character"):
		character_arting = false
