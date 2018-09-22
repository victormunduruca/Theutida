extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed #usa isso aqui pra poder mexer nessas configuracoes no inspector
var screensize

func _ready():
	screensize = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2()
	print(velocity)
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
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x) #restringe o tamanho do vetor
	position.y = clamp(position.y, 0, screensize.y)
	
