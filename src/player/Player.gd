extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SPEED = 15000
var move = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# ANIMATION NOT DONE

#USING PLACEHOLDER IMAGE

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("player_move_right")) - int(Input.is_action_pressed("player_move_left"))
	axis.y = int(Input.is_action_pressed("player_move_down")) - int(Input.is_action_pressed("player_move_up"))
	return axis.normalized()

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		move = Vector2.ZERO
	else:
		move = axis * SPEED * delta
	
	move = move_and_slide(move)
	