extends AudioStreamPlayer

var musik_normal = "res://musik_normal.mp3"
var musik_höhle = "res://musik_höhle.mp3"

@onready var hintergrundmusik = $"."


func _on_höhle_1_body_entered(body: Node2D) -> void:
	hintergrundmusik.stream = load(musik_höhle)
	hintergrundmusik.play()
	print(12)


func _on_höhle_1_body_exited(body: Node2D) -> void:
	hintergrundmusik.stream = load(musik_normal)
	hintergrundmusik.play()
