global.cinemaTimer++

if global.cinemaTimer = 60 && etape = 0
{
	global.etat.musique = mTitle
	DialogDef(6, 0, 0)
	Dialog("Merci d'avoir terminé la démo d'Onder !")
}
if global.cinemaTimer > 60 && oMoniteurDialogue.actif = false && etape = 0
{
	etape = 1
	global.cinemaTimer = 0
	Dialog("Oui, malheureusement, vous ne pouvez pas \ncombattre Ocheon !   \nÇa aurait été un peu long à coder.")
	instance_create_layer(-64, 220, "Instances", oOcheon_fin_demo)
}
if oMoniteurDialogue.actif = false && etape = 1
{
	etape = 2
	Dialog("J'espère que vous avez apprécié cette démo.")
	Dialog("À bientôt, peut-être.")
}
if oMoniteurDialogue.actif = false && etape = 2
{
	etape = 3
	global.cinemaTimer = 0
}
if etape = 3 && global.cinemaTimer = 120 {etape = 4
	Music_stop(4000)}
if etape = 4 && global.cinemaTimer = 360 {etape = 5}
if etape = 5 && global.cinemaTimer = 400 {game_end()}