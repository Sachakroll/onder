if lance = 1 && ejecter = false && global.inventaireOuvertCombat = false
{
	y += 4
}

if oJoueurCombat1_rame.collision(oOiseauCombat3) && oJoueurCombat1.coup >= 8
{
	ejecter = 1
}

if ejecter = 1
{
	y -= 24
	image_angle += 32
}