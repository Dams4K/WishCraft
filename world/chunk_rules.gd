class_name ChunkRules
extends Resource

@export var height_map: FastNoiseLite
@export var amplitude: float = 16

func get_block(pos: Vector2i):
	var ground_y = round(height_map.get_noise_1d(pos.x) * amplitude)
	if pos.y < ground_y:
		return Vector2i(-1, -1)
	elif pos.y == ground_y:
		return Vector2i(1, 0)
	elif pos.y < ground_y + 3:
		return Vector2i.ZERO
	else:
		return Vector2i(2, 0)
