extends StaticBody

onready var apple_scene = load("res://Apple.tscn")

func _ready():
#	randomize()
	spawn_apple()
	
func spawn_apple():
	var apple = apple_scene.instance()
	print("spawn apple called")
	
	var apple_spawn_location = get_node("AppleTreePivot/SpawnPath/SpawnLocation")
	
#	apple_spawn_location.unit_offset = randf()
#	var tree_location = self.transform.origin
	
	add_child(apple)
	apple.initialize(apple_spawn_location.translation)
