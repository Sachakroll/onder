// Moniteur Mort
// Parce que la mort, c'est cool

global.etat.pv = global.pvMax

global.cinemaTimer++
if global.cinemaTimer = 100
{
	DialogDef(2, 0, 0)
	Dialog("Vous êtes mort.")
	Dialog("Voulez-vous recommencer ?")
	Choix(["Oui", "Non"])
	etapeMort = 1
}

choix = GetChoix()

if etapeMort = 1 && oMoniteurDialogue.actif = false
{
	if choix = 1
	{
		etapeMort = 2
		Load()
		if global.etat.saveRoom = Plaine7
		{
			oJoueur.visible = true
			global.etat.p7_phaseBarque = 0
		}
		if global.etat.saveRoom = Plaine8
		{
			global.etat.p8_cinema1 = 0
			global.etat.p7_phaseBarque = 16
		}
	}
	if choix = 2
	{
		game_end()
	}
}