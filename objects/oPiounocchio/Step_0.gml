if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if oMoniteurDialogue.personnage == oPiounocchio
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