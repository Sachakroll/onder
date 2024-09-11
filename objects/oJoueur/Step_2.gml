/// @description Debug mode

if global.debugmode
{
	if keyboard_check_pressed(vk_f2)
	{
		Save()
	}
	if keyboard_check_pressed(vk_f3)
	{
		Load()
	}
	
	if keyboard_check_pressed(vk_f9)
	{
		global.debugmode_vision = 1 - global.debugmode_vision
	}

	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("D"))
	{
		GotoRoomDuration(Plaine1, 540, 320, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("N"))
	{
		GotoRoomDuration(Plaine6, 99, 136, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("M"))
	{
		GotoRoomDuration(Plaine7, 600, 712, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("B"))
	{
		oBarque.x = 3000
		oBarque.y = 804
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("P"))
	{
		global.cinema = true
		global.skipDialog = true
		oJoueur.visible = false
		GotoRoom(Combat1, 0, 0)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("A"))
	{
		AddInv("Pomme")
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("Q"))
	{
		AddInv("Bout déguisement")
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("Z"))
	{
		global.etat.pieces += 15
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("S"))
	{
		GotoRoomDuration(Plaine9, 300, 276, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("O"))
	{
		GotoRoomDuration(Plaine11, 110, 380, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("C"))
	{
		GotoRoomDuration(Plaine13, 10, 392, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("U"))
	{
		GotoRoomDuration(Plaine14, 376, 280, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("T"))
	{
		GotoRoomDuration(Plaine15, 10, 280, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("G"))
	{
		GotoRoomDuration(Plaine17demo, 100, 280, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("X"))
	{
		GotoRoomDuration(Plaine17, 100, 280, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("L"))
	{
		GotoRoomDuration(Plaine18, 614, 390, 1)
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("V"))
	{
		if global.volume != 0 && global.volume != 1
		{
			global.volume = 0
		}else
		{
			global.volume = 1 - global.volume
		}
	}
	if keyboard_check(vk_f1) && keyboard_check_pressed(ord("J"))
	{
		oOurs.visible=false
		oPlaine_Riviere4.image_index = 25
		global.etat.p14_cinema1 = 19
		global.cinema = true
		oCamera.x += 80
		oPlaine_mj1_cadre.sprite_index = sPlaine_mj1_cadre
		oBucheron.x = 510.5
		oBucheron.y = 274
	}
}else
{
	global.debugmode_vision = false
}