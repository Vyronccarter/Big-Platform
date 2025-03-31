extends CharacterBody2D

var movement = Vector2();
var up = Vector2(0,-1);
var speed = 200; 
var isAttacking = false; 
@onready var sprite: AnimatedSprite2D = $Node2D



# Called when the node enters the scene tree for the first time.
func _process(delta):

	if Input.is_action_pressed("ui_right") && isAttacking == false:
		movement.x = speed;
		sprite.play("walk")
	
	elif Input.is_action_just_pressed("ui_left") && isAttacking == false: 
		movement.x = -speed;
		sprite.play("walk");
	else:
		movement.x = 0;
	if isAttacking == false:
			$Node2D.play("idle");
			
	if Input.is_action_just_pressed("attack"):
		sprite.play("slash");
		isAttacking = true; 
	move_and_slide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
