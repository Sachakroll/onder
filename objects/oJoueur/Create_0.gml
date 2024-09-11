// Stats du personnage

hsp = 0
vsp = 0
movesp = 1
walksp = 1
runsp = 2
debugsp = 8
image_speed = 0
global.can_speak = true
global.cinema = false
global.cinemaTimer = 0
global.cinemaJoueurBouge = 0

global.inventaireOuvert = 0
objetSelectionne = 0
etapeInventaire = 0
choixActionInventaire = 0

sortieInventaire = 0

tempsTimer = 0

// Fonction de collision du joueur

function collision(obj)
{
	return oMasqueCollision.collision(obj)
}

// Fonction de direction d'interaction

function InteractionDirection(obj)
{
	if (place_meeting(x+1, y, obj) && sprite_index = sOnderDroite) || (place_meeting(x-1, y, obj) && sprite_index = sOnderGauche) || (place_meeting(x, y+1, obj) && sprite_index = sOnderBas) || (place_meeting(x, y-1, obj) && sprite_index = sOnderHaut)
	{
		return true
	}else
	{
		return false
	}
}

// Fonction permettant de déplacer le joueur pendant les cinématiques

cDir = 0
cPix = 0
cMov = 0
cTimer = 0

function move(_direction, _pixels)
{
	cDir = _direction
	cPix = _pixels
	cMov = 1
	cTimer = 0
	image_speed = 3
}

// Debug mode

global.debugmode_vision = false