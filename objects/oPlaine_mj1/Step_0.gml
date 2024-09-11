if global.etat.p14_cinema1 = 19
{
	timer++
	
	show_debug_message(puzzle[0])
	show_debug_message(puzzle[1])
	show_debug_message(puzzle[2])
	show_debug_message(puzzle[3])
	
	if keyboard_check(vk_left) || keyboard_check(vk_space)
	{
		vitesse = 1.5
		timer += 2
	}
	else
	{
		vitesse = 0.5
	}
	
	if timer >= 216
	{
		oBucheron.sprite_index = sBucheronBoisLancer
		oBucheron.image_index = 0
	}
	if timer >= 224
	{
		oBucheron.sprite_index = sBucheronBoisLancer
		oBucheron.image_index = 1
	}
	if timer >= 232
	{
		oBucheron.sprite_index = sBucheronBoisLancer
		oBucheron.image_index = 2
	}
	
	if timer >= 240
	{
		oBucheron.sprite_index = sBucheronBois
		timer = 0
		
		// Sélection de la rangée et du type de planche
		
		ordinal++
		type = oPlaine_mj1_planche1
		rangee = floor(random(3.999))
		if ordinal = 1
		{
			type = oPlaine_mj1_planche3
			rangee = 2
		}
		if ordinal = 2
		{
			type = oPlaine_mj1_planche1
			rangee = floor(random(3.999))
		}
		if ordinal = 3
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 4
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 5
		{
			type = oPlaine_mj1_planche2
			rangee = floor(random(2.999))
		}
		if ordinal = 6
		{
			type = oPlaine_mj1_planche3
			rangee = floor(random(2.999))
		}
		if ordinal = 7
		{
			type = oPlaine_mj1_planche1
			rangee = floor(random(3.999))
		}
		if ordinal = 8
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 9
		{
			type = oPlaine_mj1_planche1
			rangee = floor(random(3.999))
		}
		if ordinal = 10
		{
			type = oPlaine_mj1_planche2
			rangee = floor(random(2.999))
		}
		if ordinal = 11
		{
			type = oPlaine_mj1_planche1
			rangee = floor(random(3.999))
		}
		if ordinal = 12
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 13
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 14
		{
			type = oPlaine_mj1_planche3
			rangee = floor(random(2.999))
		}
		if ordinal = 17
		{
			type = oPlaine_mj1_planche3
			rangee = floor(random(2.999))
		}
		if ordinal = 20
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 21
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 22
		{
			type = oPlaine_mj1_planche2
			rangee = floor(random(2.999))
		}
		if ordinal = 24
		{
			type = oPlaine_mj1_planche4
			rangee = floor(random(3.999))
		}
		if ordinal = 25
		{
			type = oPlaine_mj1_planche4
			rangee = 2
		}

		// Création d'une planche
		var inst = instance_create_layer(500, 266 + 7 * rangee, "Instances", type)
		inst.cy = rangee
	}
	
	if puzzle[0][0] = 1
	&& puzzle[0][1] = 1
	&& puzzle[0][2] = 1
	&& puzzle[0][3] = 1
	&& puzzle[0][4] = 1
	&& puzzle[0][5] = 1
	&& puzzle[0][6] = 1
	&& puzzle[0][7] = 1
	&& puzzle[0][8] = 1
	&& puzzle[0][9] = 1
	&& puzzle[0][10] = 1
	&& puzzle[0][11] = 1
	&& puzzle[0][12] = 1
	&& puzzle[1][0] = 1
	&& puzzle[1][1] = 1
	&& puzzle[1][2] = 1
	&& puzzle[1][3] = 1
	&& puzzle[1][4] = 1
	&& puzzle[1][5] = 1
	&& puzzle[1][6] = 1
	&& puzzle[1][7] = 1
	&& puzzle[1][8] = 1
	&& puzzle[1][9] = 1
	&& puzzle[1][10] = 1
	&& puzzle[1][11] = 1
	&& puzzle[1][12] = 1
	&& puzzle[2][0] = 1
	&& puzzle[2][1] = 1
	&& puzzle[2][2] = 1
	&& puzzle[2][3] = 1
	&& puzzle[2][4] = 1
	&& puzzle[2][5] = 1
	&& puzzle[2][6] = 1
	&& puzzle[2][7] = 1
	&& puzzle[2][8] = 1
	&& puzzle[2][9] = 1
	&& puzzle[2][10] = 1
	&& puzzle[2][11] = 1
	&& puzzle[2][12] = 1
	&& puzzle[3][0] = 1
	&& puzzle[3][1] = 1
	&& puzzle[3][2] = 1
	&& puzzle[3][3] = 1
	&& puzzle[3][4] = 1
	&& puzzle[3][5] = 1
	&& puzzle[3][6] = 1
	&& puzzle[3][7] = 1
	&& puzzle[3][8] = 1
	&& puzzle[3][9] = 1
	&& puzzle[3][10] = 1
	&& puzzle[3][11] = 1
	&& puzzle[3][12] = 1
	{
		global.etat.p14_cinema1 = 19.5
		global.cinemaTimer = 0
	}
	
	if defaite_detectee
	{
		global.etat.p14_cinema1 = 19.40
		global.cinemaTimer = 0
	}
}

if global.etat.p14_cinema1 = 19.5 && global.cinemaTimer = 100
{
	global.etat.p14_cinema1 = 20
	global.cinemaTimer = 0
	oPlaine_mj1_cadre.sprite_index = sPlaine_mj1_cadre_disparition
	oPlaine_mj1_cadre.image_index = 0
}

show_debug_message(ordinal)