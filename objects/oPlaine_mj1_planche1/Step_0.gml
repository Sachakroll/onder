if moving == true && cy != -1
{
	sprite_index = sPlaine_mj1_planche1_mov
	x -= oPlaine_mj1.vitesse
	
	cx = floor(13 * (x - oPlaine_mj1_quadrillage.x) / oPlaine_mj1_quadrillage.sprite_width)
	if cx < 0
	{
		cx = 0
	}
	
	if cx < old_cx
	{
		if oPlaine_mj1.puzzle[cy][cx] == 1
		{
			x = oPlaine_mj1_quadrillage.x + 7 * (cx + 1)
			x_base = x
			y_base = y
			moving = false
			
			if old_cx == 13
			{
				ejection = 1
			}
			
			oPlaine_mj1.detecter_defaite()
		}
		else
		{
			if (old_cx <= 12)
			{
				oPlaine_mj1.puzzle[cy][old_cx] = 0
			}
			oPlaine_mj1.puzzle[cy][cx] = 1
		}
		
		old_cx = cx
	}
	
	if x <= oPlaine_mj1_quadrillage.x
	{
		x = oPlaine_mj1_quadrillage.x
		x_base = x
		y_base = y
		moving = false
	}
	
	if keyboard_check_pressed(vk_down) && cy < 3
	{
		if cx > 12
		{
			cy++
			y += 7
		}
		else if oPlaine_mj1.puzzle[cy+1][cx] == 0
		{
			oPlaine_mj1.puzzle[cy][cx] = 0
			cy++
			y += 7
			oPlaine_mj1.puzzle[cy][cx] = 1
		}
	}
	
	if keyboard_check_pressed(vk_up) && cy > 0
	{
		if cx > 12
		{
			cy--
			y -= 7
		}
		else if oPlaine_mj1.puzzle[cy-1][cx] == 0
		{
			oPlaine_mj1.puzzle[cy][cx] = 0
			cy--
			y -= 7
			oPlaine_mj1.puzzle[cy][cx] = 1
		}
	}
}
else
{
	sprite_index = sPlaine_mj1_planche1_pos
}

if global.etat.p14_cinema1 = 20 && global.cinemaTimer = 75
{
	instance_destroy()
}


if ejection > 0
{
	ejection++
	if ejection = 9
	{
		x+=4
		y+=4
	}
	if ejection > 8
	{
		sprite_index = sPlaine_mj1_planche1_ej
		image_angle += 20
		x+=2
		y-=2
	}
}

if y < 0
{
	instance_destroy()
}

// Écroulement du pont lors de la défaite

if global.etat.p14_cinema1 = 19.42
{
	if global.cinemaTimer < 118
	{
		trembler(0.5)
		show_debug_message(timer)
		show_debug_message(limite_timer)
	}
	if global.cinemaTimer > 120
	{
		y+=0.5
	}
	if y > 310 || global.cinemaTimer = 199
	{
		instance_destroy()
	}
}
