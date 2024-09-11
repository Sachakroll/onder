if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if oMoniteurDialogue.personnage == oOcheonCastor && oMoniteurDialogue.actif && oMoniteurDialogue.bouche == 1
{
		image_index = 1
}else
{
	image_index = 0
}
