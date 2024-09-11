hsp = 0
movesp = 6
timerAnimation = 0
timerMort = 0

coup = 0

global.inventaireOuvertCombat = 0
objetSelectionne = 0
etapeInventaire = 0
choixActionInventaire = 0
sortieInventaire = 0

function collision(obj)
{
	return place_meeting(x, y, obj)
}
