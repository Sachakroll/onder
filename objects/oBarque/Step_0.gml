if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

timerAlternant = 1 - timerAlternant

// Récupérer les touches du clavier

if oiseau = 0 && global.etat.p7_phaseBarque < 15
{
	key_up = keyboard_check(vk_up)
	key_down = keyboard_check(vk_down)
	key_enter = keyboard_check_pressed(vk_enter)
	if key_enter = 0
	{
		key_enter = keyboard_check_pressed(ord("Z"))
	}
}else
{
	key_up = 0
	key_down = 0
	key_enter = 0
}

if global.etat.p7_phaseBarque >= 2 && timerAlternant = 1 && global.etat.p9_degatsBarque < 5 && global.etat.p7_phaseBarque != 14 && global.etat.p7_phaseBarque != 15 && global.etat.p7_phaseBarque != 17
{	
	if key_up
	{
		dir = "up"
	}
	if key_down
	{
		dir = "down"
	}
	
	// Mouvements de la barque
	
	moveV = key_down - key_up
	vsp = moveV * movesp
	
	// Collisions
	
	if place_meeting(x+hsp, y, oDeclencheurZone2)
	{
		rebond = 1
		global.etat.p9_degatsBarque++
	}else
	{
		if place_meeting(x+hsp, y, oCollision1)
		{
			hsp = 0
		}else
		{
			hsp = 1
		}
	}
	
	if rebond > 0
	{
		hsp = -4
		rebond ++
		if rebond = 6
		{
			rebond = 0
		}
	}
	
	if place_meeting(x-1, y+vsp, oCollision1) 
	{
		vsp = 0
	}
	
	// Déplacement de la barque
	
	x += hsp
	y += vsp
}

// Coups de rame
	
if key_enter && coup = false && global.etat.p7_phaseBarque && global.etat.p9_degatsBarque < 5 && oiseau = 0
{
	coup = true
	timerCoup = 0
}

// Caméra

if global.etat.p7_phaseBarque >= 1.5
{
	global.cinema = true
	oCamera.x = x+32
	oCamera.y = y
}

// Gestion des dégats

if global.etat.p9_degatsBarque = 0 && global.etat.p7_phaseBarque >= 1.5
{
	sprite_index = sBarque1
	image_speed = 0
}

if global.etat.p9_degatsBarque = 1 && global.etat.p7_phaseBarque >= 1.5
{
	sprite_index = sBarque2
	image_speed = 0
}

if global.etat.p9_degatsBarque = 2 && global.etat.p7_phaseBarque >= 1.5
{
	sprite_index = sBarque3
	image_speed = 0
}

if global.etat.p9_degatsBarque = 3 && global.etat.p7_phaseBarque >= 1.5
{
	sprite_index = sBarque4
	image_speed = 0
}

if global.etat.p9_degatsBarque = 4 && global.etat.p7_phaseBarque >= 1.5
{
	sprite_index = sBarque5
	image_speed = 0
}

if global.etat.p9_degatsBarque = 5 && global.etat.p7_phaseBarque >= 1.5 && global.etat.p7_phaseBarque != 2.4
{
	sprite_index = sBarque6
	image_speed = 1
	image_index = 0
	global.etat.p7_phaseBarque = 2.4
	global.cinemaTimer = 0
}

if global.etat.p7_phaseBarque = 2.4
{
	global.cinemaTimer++
	if global.cinemaTimer = 400
	{
		Music_stop(7500)
	}
	if global.cinemaTimer = 799
	{
		image_speed = 0
	}
	if global.cinemaTimer = 800
	{
		Fade(60)
	}
	if global.cinemaTimer = 860
	{
		room_goto(Mort)
	}
}

// Animations

timerAnimation++
if timerAnimation = 86
{
	timerAnimation = 0
}

if global.etat.p9_degatsBarque < 5 && coup = false && oiseau = 0 && global.etat.p7_phaseBarque != 17
{
	if dir = "up"
	{
		if timerAnimation < 43
		{
			image_index = 1
		}
		if timerAnimation > 42
		{
			image_index = 0
		}
	}
	
	if dir = "down"
	{
		if timerAnimation < 43
		{
			image_index = 3
		}
		if timerAnimation > 42
		{
			image_index = 2
		}
	}
}

if global.etat.p9_degatsBarque < 5 && coup = true && oiseau = 0 && global.etat.p7_phaseBarque != 17
{
	timerCoup++
	if timerCoup < 10
	{
		image_index = 4
	}
	if timerCoup > 10 && timerCoup < 15
	{
		image_index = 5
	}
	if timerCoup > 15 && timerCoup < 20
	{
		image_index = 6
	}
	if timerCoup > 20 && timerCoup < 30
	{
		image_index = 7
	}
	if timerCoup = 30
	{
		coup = false
	}
}

// Se prendre les oiseaux

if global.etat.p9_degatsBarque < 5 && (oBarqueTete.collision(oOiseau) || oBarqueTete.collision(oOiseau2) || oBarqueTete.collision(oOiseau3)) && oiseau = 0
{
	oiseau = 1
	image_index = 8
	image_speed = 0
	timerOiseau = 0
	oiseauCooldown = 30
}

if oiseauCooldown > 0
{
	oiseauCooldown--
}

if oiseau = 1
{
	timerOiseau++
	if timerOiseau = 10
	{
		image_index = 9
	}
	if timerOiseau = 20
	{
		image_index = 10
	}
	if timerOiseau = 30
	{
		image_index = 11
	}
	if timerOiseau = 60
	{
		image_index = 12
	}
	if timerOiseau = 70
	{
		image_index = 13
	}
	if timerOiseau = 80
	{
		image_index = 14
	}
	if timerOiseau = 90
	{
		image_index = 15
	}
	if timerOiseau = 100
	{
		image_index = 0
		oiseau = 0
	}
}