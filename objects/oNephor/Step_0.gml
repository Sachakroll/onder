if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if oMoniteurDialogue.personnage == oNephor && mov = 0 && cin = 0
{
	if oMoniteurDialogue.bouche == 1
	{
		image_index = 1
	}
	else
	{
		image_index = 0
	}
}

if mov = 1
{
	if dir = "droite" && timer <= pix
	{
		sprite_index = sNephorDroite
		x++
	}
	if dir = "gauche" && timer <= pix
	{
		if plat = 0
		{
			sprite_index = sNephorGauche
		}
		if plat = 1
		{
			sprite_index = sNephorGauchePlats
		}
		x--
	}
	if dir = "haut" && timer <= pix
	{
		sprite_index = sNephorHaut
		y--
	}
	if dir = "bas" && timer <= pix
	{
		if plat = 0
		{
			sprite_index = sNephorBas
		}
		if plat = 1
		{
			sprite_index = sNephorBasPlats
		}
		y++
	}
	
	if timer = pix
	{
		mov = 0
		image_index = 0
		image_speed = 0
	}
}