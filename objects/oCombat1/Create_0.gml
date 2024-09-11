init = 0

phase = ""
timerOiseaux = 0
oiseauxActif = false
phaseOiseaux = 0
positionOiseau = 200
delaiToucheOiseau = 0

timerPose = 0

joueurTouche = 0

descenteX = 0
descenteY = 0

mort = 0

global.combat1CanMove = 0
if global.etatPersistant.combat1atteint
{
	global.etat.p8_cinema1 = 7
}else
{
	global.etat.p8_cinema1 = 6
}
global.cinemaTimer = 0

explosionBouclier = 0

if global.skipDialog
{
	global.etat.p8_cinema1 = 8
	global.combat1CanMove = 1
}

oPiounocchioCombat.sprite_index = sPiounocchioCombat1