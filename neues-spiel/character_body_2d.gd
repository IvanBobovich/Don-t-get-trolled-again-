extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const CLIMB_VELOCITY = -100

@onready var player_sprite = $AnimatedSprite2D
@onready var punkte_label = $"../CanvasLayer/Control/Label"
@onready var einstiegspunkt = position

var is_on_ladder = false
var punkte = 0
var sprung_max = 1
var sprung_aktuell = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not is_on_ladder:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and sprung_aktuell < sprung_max:
		sprung_aktuell += 1
		velocity.y = JUMP_VELOCITY
		print(sprung_aktuell)
	elif is_on_floor():
		sprung_aktuell = 0
		
	if is_on_ladder:
		var direction_y = Input.get_axis("ui_down", "ui_up")
		if direction_y:
			velocity.y = direction_y * CLIMB_VELOCITY
		else:
			velocity.y = move_toward(velocity.y, 0, -CLIMB_VELOCITY)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		# Falls in Bewegung, spielt die (in player_sprite gespeicherte) Spielfigur die Animation "laufen" ab
		player_sprite.play("laufen")
		velocity.x = direction * SPEED
		# Falls die Geschwindigkeit negativ ist, d.h. die Spielfigur nach links geht, wird sie gespiegelt angezeigt (so dass sie nach links schaut)
		if velocity.x < 0:
			player_sprite.flip_h = false
		# Falls die Geschwindigkeit positiv ist, d.h. die Spielfigur nach rechts geht, wird sie ungespiegelt angezeigt (so dass sie nach rechts schaut)
		elif velocity.x > 0:
			player_sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Falls im Ruhezustand, spielt die Spielfigur die Animation "ruhe" ab
		player_sprite.play("ruhe")

	move_and_slide()
	

func _process(delta: float) -> void:
	punkte_label.text = str(punkte)


func _on_leiter_body_entered(body: Node2D) -> void:
	is_on_ladder = true


func _on_leiter_body_exited(body: Node2D) -> void:
	is_on_ladder = false


func _on_weltrand_body_entered(body: Node2D) -> void:
	position = einstiegspunkt
