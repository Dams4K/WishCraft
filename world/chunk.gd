class_name Chunk
extends Node2D

@export var size: Vector2i = Vector2i(16, 16)
@export var rules: ChunkRules

func generate(tilemap: TileMap, z: int = 0):
	for local_x in range(size.x):
		for local_y in range(size.y):
			var global_x = position.x + local_x
			var global_y = position.y + local_y
			
			var block_pos = Vector2i(global_x, global_y)
			tilemap.set_cell(0, block_pos, 0, rules.get_block(block_pos))
