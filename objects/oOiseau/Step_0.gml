if lance = 1 && ejecter = false
{
	x--
}

depth = oBarque.depth - 20

if oBarque.coup = true && oBarqueRame.collision(oOiseau) && oBarque.timerCoup > 15
{
	ejecter = 1
}

if ejecter = 1
{
	x = x + 5
	image_angle += 24
}