if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if room = Plaine7
{
	if global.etat.p7_pommePrise = 1
	{
		image_index = 1
	}else
	{
		image_index = 0
	}
}

if room = Plaine12
{
	if global.etat.p12_pommePrise = 1
	{
		image_index = 1
	}else
	{
		image_index = 0
	}
}