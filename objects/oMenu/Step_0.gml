timerMenu++

if timerMenu < 100 && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
{
	timerMenu = 100
	cooldown = 0
}

if cooldown = 0 || cooldown = 1
{
	cooldown++
}

if timerMenu >= 100 && timerCommencer = 0
{
	if choixMenu == 1
	{
		image_index = 1
		if keyboard_check_pressed(vk_down) && cooldown = 2
		{
			cooldown = 0
			choixMenu = 2
		}
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && cooldown = 2
		{
			timerCommencer = 1
			Fade(60)
		}
	}
	if choixMenu == 2
	{
		image_index = 2
		if keyboard_check_pressed(vk_up) && cooldown = 2
		{
			cooldown = 0
			choixMenu = 1
		}
		if keyboard_check_pressed(vk_down) && cooldown = 2
		{
			cooldown = 0
			choixMenu = 3
		}
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && cooldown = 2
		{
			room_goto(Options)
		}
	}
	if choixMenu == 3
	{
		image_index = 3
		if keyboard_check_pressed(vk_up) && cooldown = 2
		{
			cooldown = 0
			choixMenu = 2
		}
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && cooldown = 2
		{
			game_end()
		}
	}
}

if timerCommencer > 0
{
	timerCommencer++
	if timerCommencer = 60
	{
		room_goto(Plaine1)
		global.etat.playtime = 0
	}
}

show_debug_message("menu")