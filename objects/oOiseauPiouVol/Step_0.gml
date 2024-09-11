if lance = 1 && ejecter = false
{
	if dir = 0
	{
		x--
	}
	if dir = 1
	{
		x++
	}
}

depth = oBarque.depth - 20

if oBarque.coup = true && oBarqueRame.collision(oOiseauPiouVol) && oBarque.timerCoup > 15
{
	ejecter = 1
}

if ejecter = 1
{
	x = x + 5
	image_angle += 24
}

if x < oBarque.x - 30
{
	dir = 1
}
if x > oBarque.x + 30
{
	dir = 0
}

if dir = 0
{
	sprite_index = sPiouVolGauche
}
if dir = 1
{
	sprite_index = sPiouVolDroite
}