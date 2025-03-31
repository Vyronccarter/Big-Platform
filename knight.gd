extends CharacterBody2D
#reference to the animatedsprite2d node 
@onready var anime = $Node2D 


@export var speed:float = 200.0


var is_moving:bool = false
var dir:String = "none"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta):
	pass



	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT * speed
		is_moving = true
		dir = "left"
		
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT * speed
		is_moving = true 
		dir = "right"
		
	elif Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP * speed 
		is_moving = true
		dir = "up"
		
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN * speed
		is_moving = true
		dir = "down"
		
	else:
		velocity = Vector2.ZERO
		is_moving = false
	
	move_and_slide()
	
	
	
	
	
#run animations code

	if is_moving == true:
		if dir == "left":
			anime.play("left")
			
		elif dir == "right":
			anime.play("right")
			
		elif dir == "up":
			anime.play("up")
			
		elif dir == "down":
			anime.play("up")
			
	
	
	#idle animations code 
	elif is_moving == false:
		
		
		if dir == "left":
			anime.play("idle_left")
			
		elif dir == "right":
			anime.play("idle_right")
			
		elif dir == "up":
			anime.play("idle_up")
			
		elif dir == "down":
			anime.play("idle_down")

















	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

	pass
