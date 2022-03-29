extends StaticBody

export (PackedScene) var apple_scene

func _ready():
	var apple = apple_scene.instance()
	
	var apple_spawn_location = get_node("AppleTreePivot/SpawnPath/SpawnLocation")
	apple_spawn_location.unit_offset = randf()\
	
	add_child(apple)
	apple.initialize()
