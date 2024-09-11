if oJoueur.y < y
{
	depth = oJoueur.depth - 30
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 10
}

if oMoniteurDialogue.personnage == oBucheron && oMoniteurDialogue.actif
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