if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}

if global.etat.p9_degatsBarque = 0
{
	sprite_index = sBarque0
}
if global.etat.p9_degatsBarque = 1
{
	sprite_index = sBarque2_p9
}
if global.etat.p9_degatsBarque = 2
{
	sprite_index = sBarque3_p9
}
if global.etat.p9_degatsBarque = 3
{
	sprite_index = sBarque4_p9
}
if global.etat.p9_degatsBarque = 4
{
	sprite_index = sBarque5_p9
}