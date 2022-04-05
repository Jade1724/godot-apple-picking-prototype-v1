extends StaticBody

func initialize(start_position, player_position):
	translation = start_position
	# We turn the mob so it looks at the player.
	look_at(player_position, Vector3.UP)
