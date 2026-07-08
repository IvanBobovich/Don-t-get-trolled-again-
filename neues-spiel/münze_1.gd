extends Area2D


@onready var coin_cling_sound = $"../coin_cling_sound"


func _on_body_entered(body: Node2D) -> void:
	coin_cling_sound.play()
	queue_free()
	body.punkte += 1
