extends Sprite2D

@onready var moveControllerButton: = $MoveControllerButton
@onready var radius = Vector2(moveControllerButton.shape.radius, moveControllerButton.shape.radius)
var background_len = 80
var ongoing_drag = -1
var return_accel = 30


func _ready() -> void:
	moveControllerButton.position = -radius


func _process(delta: float) -> void:
	if ongoing_drag == -1:
		var pos_difference = (Vector2.ZERO - radius) - moveControllerButton.position
		moveControllerButton.position += pos_difference * return_accel * delta


func get_button_pos():
	return moveControllerButton.position + radius


func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		var event_dist_from_centre = (event.position - global_position).length()
		
		if event_dist_from_centre <= radius.x * global_scale.x or event.get_index() == ongoing_drag:
			event.position.y = position.y
			moveControllerButton.global_position = event.position - radius * global_scale
			moveControllerButton.position.x = clamp(moveControllerButton.position.x, -background_len - radius.x, background_len - radius.x)
		ongoing_drag = event.get_index()
	
	elif event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == ongoing_drag:
		ongoing_drag = -1


func get_value() -> Vector2:
	if ongoing_drag == -1:
		return Vector2.ZERO
	return get_button_pos()
