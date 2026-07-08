extends Area2D

# Referenz auf den Kindknoten vom Typ AnimatedSprite2D (wie es aussieht)
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_sound = $"../jump sound"

# Wird aufgerufen, wenn ein Knoten die Area2D berührt
func _on_body_entered(body: Node2D) -> void:
	# Der Knoten bekommt eine Geschwindigkeit von -600
	body.velocity.y = -600
	# Das AnimatedSprite2D spielt seine Animation ab
	animated_sprite_2d.play()
	jump_sound.play()
