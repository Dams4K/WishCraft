#@tool
extends Node2D

@export var chunks_rules: ChunkRules

@export var regenerate: bool = false:
	set(v):
		generate()

@onready var chunks: Node = $Chunks

func _process(delta: float) -> void:
	generate()

func generate() -> void:
	$Map.clear()
	var size = Vector2i(8, 8)
	for y in range(4):
		for x in range(4):
			var new_chunk = Chunk.new()
			new_chunk.rules = chunks_rules
			new_chunk.size = size
			new_chunk.position = Vector2(x * size.x, y * size.y)
			chunks.add_child(new_chunk)
			new_chunk.generate($Map)
