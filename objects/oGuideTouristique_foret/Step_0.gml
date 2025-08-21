depth = oGuideTouristique_foret_stand.depth + 10

if oMoniteurDialogue.personnage == oGuideTouristique_foret && oMoniteurDialogue.actif
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