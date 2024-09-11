if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if timer > 0
{
	timer++
}
if timer < 0
{
	timer--
}

if timer = 25
{
	global.etat.levierOcheonActif = 2
}
if timer = -25
{
	global.etat.levierOcheonActif = 2
}

if timer = 40
{
	global.etat.levierOcheonActif = 1
}
if timer = -40
{
	global.etat.levierOcheonActif = 0
}

if timer = 50 || timer = -50
{
	timer = 0
	global.cinema = false
}

if Interaction(oLevier)
{
	//play sound
	if global.etat.levierOcheonActif = 0
	{
		timer = 1
	}
	if global.etat.levierOcheonActif = 1
	{
		timer = -1
	}
	global.cinema = true
}

image_index = global.etat.levierOcheonActif