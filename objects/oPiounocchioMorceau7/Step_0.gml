if oCombat1.explosionBouclier = 0
{
	visible = false
}
if oCombat1.explosionBouclier > 0
{
	visible = true
	image_angle += 16
	x += 8
	y -= 12
}