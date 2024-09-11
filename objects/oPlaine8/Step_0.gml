if oBarque.x = 116
{
	global.etat.musique = mPiou
	Save()
	
	oBarque.x = 117
	global.etat.p7_phaseBarque = 17
	global.cinemaTimer = 0
	global.cinema = true
	if global.etatPersistant.combat1atteint = true
	{
		global.etat.p8_cinema1 = 3
	}else
	{
		global.etat.p8_cinema1 = 1
	}
}

if global.etat.p8_cinema1 = 1
{
	global.cinemaTimer++
	if global.cinemaTimer = 80
	{
		DialogDef(6, sPiounocchioTete1, oPiounocchio)
		Dialog("Toi !  ")
		global.etat.p8_cinema1 = 2
		Dialog("Je t'ai vu ! Tu as frappé Piou, mon \noiseau favori, avec ta rame !")
		Dialog("Quel affront ! Quelle cruauté ! ")
		Choix(["Il m'a attaqué", "J'étais obligé", "Pardon", "C'est faux"])
	}
}

if global.etat.p8_cinema1 = 2 && oMoniteurDialogue.actif = false
{
	choix = GetChoix()
	DialogDef(6, sPiounocchioTete2, oPiounocchio)
	if choix = 1
	{
		Dialog("N'importe quoi ! \nMon Piou n'attaque jamais personne, \nil ne ferait pas de mal à une mouche !")
	}
	if choix = 2
	{
		Dialog("N'importe quoi ! Personne n'est obligé \nd'avoir recours à la violence !")
		Dialog("Mon Piou le sait très bien, il ne ferait \npas de mal à une mouche !")
	}
	if choix = 3
	{
		Dialog("Comme si j'allais te pardonner pour ça ! \nCe que tu as fait est inacceptable ! \nMon Piou ne ferait pas de mal à une \nmouche !")
	}
	if choix = 4
	{
		Dialog("Mensonge ! Je t'ai très bien vu ! \nCe que tu as fait est inacceptable ! \nMon Piou ne ferait pas de mal à une \nmouche !")
	}
	global.etat.p8_cinema1 = 3
}

if global.etat.p8_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	oPiounocchio.sprite_index = sPiounocchioEnerve
	DialogDef(6, sPiounocchioTeteEnerve, oPiounocchio)
	if global.etatPersistant.combat1atteint
	{
		choix = 1
	}
	if choix = 1 || choix = 2
	{
		Dialog("Je vais te faire payer ce que tu as fait ! \nPiou, à l'attaque !")
	}
	if choix = 3 || choix = 4
	{
		Dialog("Je vais te le faire payer ! \nPiou, à l'attaque !")
	}
	global.etat.p8_cinema1 = 4
}

if global.etat.p8_cinema1 = 4 && oMoniteurDialogue.actif = false
{
	global.etat.p8_cinema1 = 5
	GotoRoom(Combat1, 0, 0)
}

show_debug_message(global.etat.p8_cinema1)