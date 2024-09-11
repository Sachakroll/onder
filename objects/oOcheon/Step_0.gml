if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if oMoniteurDialogue.personnage == oOcheon && oMoniteurDialogue.actif
{
	if oMoniteurDialogue.bouche == 1
	{
		image_index = 1
	}
	else
	{
		image_index = 0
	}
	
	if sprite_index = sOcheonBasParle || sprite_index = sOcheonBasEtonne || sprite_index = sOcheonBasHm || sprite_index = sOcheonBasDetermine || sprite_index = sOcheonBasParleGene
	{
		if oMoniteurDialogue.sprite = sOcheonTete
		{
			sprite_index = sOcheonBasParle
		}
		if oMoniteurDialogue.sprite = sOcheonTeteGene
		{
			sprite_index = sOcheonBasParleGene
		}
		if oMoniteurDialogue.sprite = sOcheonTeteTresEtonne || oMoniteurDialogue.sprite = sOcheonTeteOh || oMoniteurDialogue.sprite = sOcheonTeteEtonne
		{
			sprite_index = sOcheonBasEtonne
		}
		if oMoniteurDialogue.sprite = sOcheonTeteHm
		{
			sprite_index = sOcheonBasHm
		}
		if oMoniteurDialogue.sprite = sOcheonTeteDetermine
		{
			sprite_index = sOcheonBasDetermine
		}
	}
}

if room = Plaine13
{
	depth = oOcheonCastor.depth + 30
}

if room = Plaine20 && oMoniteurDialogue.actif = false
{
	sprite_index = sOcheonBasParle
}