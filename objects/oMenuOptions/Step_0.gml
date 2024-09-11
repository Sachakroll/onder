if cooldown = 0 || cooldown = 1
{
	cooldown++
}

if choixMenu == 1
{
	image_index = 0
	if keyboard_check_pressed(vk_down) && cooldown = 2
	{
		cooldown = 0
		choixMenu = 2
	}
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && cooldown = 2
	{
		room_goto(Menu)
	}
}
if choixMenu == 2
{
	image_index = 1
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
	if keyboard_check_pressed(vk_left) && cooldown = 2 && global.volume > 0
	{
		global.volume -= 0.1
		cooldown = 0
	}
	if keyboard_check_pressed(vk_right) && cooldown = 2 && global.volume < 1
	{
		global.volume += 0.1
		cooldown = 0
	}
}
if choixMenu == 3
{
	image_index = 2
	if keyboard_check_pressed(vk_up) && cooldown = 2
	{
		cooldown = 0
		choixMenu = 2
	}
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) && cooldown = 2
	{
		global.debugmode = 1 - global.debugmode
		cooldown = 0
	}
}

show_debug_message("options")