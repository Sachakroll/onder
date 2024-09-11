function plonger(destX, destY, vitesse)
{
	distX = destX - x
	distY = destY - y
	diag = sqrt(distX * distX + distY * distY)
	pas = vitesse / diag
	x += distX * pas
	y += distY * pas
}