//Pommier

if Interaction(oPommier) && global.etat.p12_pommePrise = 0
{
	global.etat.p12_pommePrise = 0.1
	DialogDef(6, 0, 0)
	Dialog("C'est un pommier.    \nCueillir une pomme ?")
	Choix(["Oui", "Non"])
}

choix = GetChoix()

if global.etat.p12_pommePrise = 0.1 && oMoniteurDialogue.actif = false
{
	if choix = 1
	{
		global.etat.p12_pommePrise = 1
		Dialog("Vous prenez une pomme.")
		AddInv("Pomme")
		Dialog("Appuyez sur I pour ouvrir votre inventaire.")
	}
	if choix = 2
	{
		global.etat.p12_pommePrise = 0
	}
}

if Interaction(oPommier) && global.etat.p12_pommePrise = 1 && global.can_speak
{
	DialogDef(6, 0, 0)
	Dialog("Les autres pommes sont trop hautes pour que \nvous puissiez les atteindre.")
}