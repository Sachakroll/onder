depth = oJoueur.depth - 100

if global.etat.p14_cinema1 < 16
{
	image_speed = 0
}else
{
	image_speed = 1
}

if global.etat.p14_cinema1 > 20
{
	image_speed = 0
	image_index = 0
	sprite_index = sPlaine_mj1_cadre_apparition
}