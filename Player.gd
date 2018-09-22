extends Area2D

signal hit 
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed #usa isso aqui pra poder mexer nessas configuracoes no inspector
var screensize
var anim = ""
var animacao = ""
var has_key 
func _ready():
	has_key = false
	screensize = get_viewport_rect().size



func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		anim = "swim"
	
	position += velocity * delta
	#position.x = clamp(position.x, 0, screensize.x) #restringe o tamanho do vetor
	#position.y = clamp(position.y, 0, screensize.y)
	if velocity.x != 0:
	   	anim = "swim"
	    $Sprite.flip_v = false
	    $Sprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
	    anim = "swim"
	    $Sprite.flip_v = velocity.y > 0
	if(animacao != anim):
		$Sprite/AnimationPlayer.play(anim)
		animacao = anim

	


func _on_Player_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Key":
		has_key = true
		print("tem a chave porra")
	elif body.get_name() == "Door" and has_key:
		opened_door()
	else:
		hide()
		#morre
	emit_signal("hit")
	#$CollisionShape2D.disabled = true
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	has_key = false


func opened_door():
	print("opened door")
	
