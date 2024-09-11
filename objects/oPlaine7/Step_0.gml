// Traversée du pont

if (oJoueur.x > 197 && oJoueur.x < 240)
{
	if (oJoueur.x > 200 && oJoueur.x < 237)
	{
		if (oJoueur.x > 204 && oJoueur.x < 233)
		{
			if (oJoueur.x > 211 && oJoueur.x < 226)
			{
				sprite_set_offset(oJoueur.sprite_index, 6, 31)
			}else
			{
				sprite_set_offset(oJoueur.sprite_index, 6, 30)
			}
		}else
		{
			sprite_set_offset(oJoueur.sprite_index, 6, 29)
		}
	}else
	{
		sprite_set_offset(oJoueur.sprite_index, 6, 28)
	}
}else
{
	sprite_set_offset(oJoueur.sprite_index, 6, 27)
}

//Pommier

if Interaction(oPommier) && global.etat.p7_pommePrise = 0
{
	global.etat.p7_pommePrise = 0.1
	DialogDef(6, 0, 0)
	Dialog("C'est un pommier.    \nCueillir une pomme ?")
	Choix(["Oui", "Non"])
}

choix = GetChoix()

if global.etat.p7_pommePrise = 0.1 && oMoniteurDialogue.actif = false
{
	if choix = 1
	{
		global.etat.p7_pommePrise = 1
		Dialog("Vous prenez une pomme.")
		AddInv("Pomme")
		Dialog("Appuyez sur I pour ouvrir votre inventaire.")
	}
	if choix = 2
	{
		global.etat.p7_pommePrise = 0
	}
}

if Interaction(oPommier) && global.etat.p7_pommePrise = 1 && global.can_speak
{
	DialogDef(6, 0, 0)
	Dialog("Les autres pommes sont trop hautes pour que \nvous puissiez les atteindre.")
}

//Panneau Oiseaux

if Interaction(oPanneauOiseaux)
{
	DialogDef(6, 0, 0)
	Dialog("Attention ! Oiseaux dangereux.")
	Dialog("Cette rivière est habitée par des oiseaux qui \nattaquent toute personne essayant de la traverser \nen barque.")
	Dialog("Si vous voulez tout de même la traverser, sachez \nque vous pouvez vous en protéger de deux façons.")
	Dialog("Vous pouvez soit les éviter en déplaçant votre \nbarque vers le haut ou vers le bas, \nsoit leur donner des coups de rame avec ENTRÉE \nou Z.")
	Dialog("Faites aussi attention à ne pas cogner votre \nbarque contre les racines des arbres, \ncela pourrait l'endommager.")
	Dialog("Bonne chance.")
	global.etat.p7_panneauOiseauxLu = 1
}

//Monter dans la barque

if Interaction(oDeclencheurZone) && global.etat.p7_phaseBarque = 0
{
	global.etat.p7_phaseBarque = 0.5
	if global.etat.p7_panneauOiseauxLu = 1
	{
		DialogDef(6, 0, 0)
		Dialog("Voulez vous monter dans la barque ?")
	}
	if global.etat.p7_panneauOiseauxLu = 0
	{
		DialogDef(6, 0, 0)
		Dialog("Voulez vous vraiment monter dans la barque \nsans avoir lu le panneau d'avertissement \net d'instructions ?")
	}
	Choix(["Oui", "Non"])
}

choix = GetChoix()

if global.etat.p7_phaseBarque = 0.5 && oMoniteurDialogue.actif = 0
{
	if choix = 1
	{
		global.etat.p7_phaseBarque = 1
		global.cinema = true
		Fade(80)
		Music_change(mValse_des_canards, 1200, 80)
		global.cinemaTimer = 0
		
		// Sauvegarde automatique
		
		global.etat.saveRoom = room
		global.etat.saveX = 600
		global.etat.saveY = 712
		global.etatSave = struct_copy(global.etat)
	}
	if choix = 2
	{
		global.etat.p7_phaseBarque = 0
	}
}

if global.etat.p7_phaseBarque = 1 || global.etat.p7_phaseBarque = 1.5
{
	global.cinemaTimer++
	if global.cinemaTimer = 80
	{
		oJoueur.visible = false
		global.etat.p7_phaseBarque = 1.5
	}
	if global.cinemaTimer = 160
	{
		global.etat.p7_phaseBarque = 2
	}
}

//Phase en barque

if oBarque.x = 1650 && global.etat.p7_phaseBarque = 2
{
	oOiseau.lancer(oBarque.x + 130, 766)
	global.etat.p7_phaseBarque = 3
}

if oBarque.x = 1720 && global.etat.p7_phaseBarque = 3
{
	oOiseau2.lancer(oBarque.x + 130, 750)
	global.etat.p7_phaseBarque = 4
}

if oBarque.x = 1790 && global.etat.p7_phaseBarque = 4
{
	oOiseau.lancer(oBarque.x + 130, 742)
	global.etat.p7_phaseBarque = 5
}

if oBarque.x = 1820 && global.etat.p7_phaseBarque = 5
{
	oOiseau2.lancer(oBarque.x + 130, 766)
	global.etat.p7_phaseBarque = 6
}

if oBarque.x = 1915 && global.etat.p7_phaseBarque = 6
{
	oOiseau3.lancer(oBarque.x + 130, 758)
	global.etat.p7_phaseBarque = 7
}

if oBarque.x = 2000 && global.etat.p7_phaseBarque = 7
{
	oOiseau2.lancer(oBarque.x + 130, 740)
	global.etat.p7_phaseBarque = 8
}

if oBarque.x = 2060 && global.etat.p7_phaseBarque = 8
{
	oOiseau.lancer(oBarque.x + 130, 766)
	global.etat.p7_phaseBarque = 9
}

if oBarque.x = 2145 && global.etat.p7_phaseBarque = 9
{
	oOiseau3.lancer(oBarque.x + 130, 760)
	global.etat.p7_phaseBarque = 10
}

if oBarque.y <= 770
{
	if oBarque.x = 2315 && global.etat.p7_phaseBarque = 10
	{
		oOiseau.lancer(oBarque.x + 130, 714)
		global.etat.p7_phaseBarque = 11
	}

	if oBarque.x = 2350 && global.etat.p7_phaseBarque = 11
	{
		oOiseau2.lancer(oBarque.x + 130, 732)
		global.etat.p7_phaseBarque = 12
	}
}

if oBarque.y > 770
{
	if oBarque.x = 2320 && global.etat.p7_phaseBarque = 10
	{
		oOiseau.lancer(oBarque.x + 130, 818)
		global.etat.p7_phaseBarque = 11
	}

	if oBarque.x = 2355 && global.etat.p7_phaseBarque = 11
	{
		oOiseau2.lancer(oBarque.x + 130, 832)
		global.etat.p7_phaseBarque = 12
	}
}

if oBarque.x = 2592 && global.etat.p7_phaseBarque = 12
{
	oOiseau3.lancer(oBarque.x + 130, 786)
	global.etat.p7_phaseBarque = 13
}

// Attaque de Piou

if oBarque.x = 2816
{
	global.etat.p7_phaseBarque = 13.5
	oOiseauPiouVol.lancer(3016, 790)
	oBarque.x = 2817
	global.cinemaTimer = 0
}

if global.etat.p7_phaseBarque = 13.5
{
	global.cinemaTimer++
	if global.cinemaTimer = 110
	{
		global.etat.p7_phaseBarque = 14
	}
}

if oOiseauPiouVol.ejecter = true && (global.etat.p7_phaseBarque = 14 || global.etat.p7_phaseBarque = 13.5)
{
	global.cinemaTimer = 0
	global.etat.p7_phaseBarque = 15
}

if global.etat.p7_phaseBarque = 15
{
	global.cinemaTimer++
	if global.cinemaTimer = 100
	{
		global.etat.p7_phaseBarque = 16
	}
}

timerAlternant10++
if timerAlternant10 = 10
{
	timerAlternant10 = 0
}

timerAlternant4++
if timerAlternant4 = 4
{
	timerAlternant4 = 0
}

if oBarque.x = 3080
{	
	GotoRoom(Plaine8, 10, 270)
}

// Cônes

if Interaction(oCone) || Interaction(oConeParle)
{
	if global.etat.p7_coneParle = 4
	{
		DialogDef(6, 0, oConeParle)
		Dialog("...")
	}
	if global.etat.p7_coneParle = 3
	{
		DialogDef(6, 0, oConeParle)
		Dialog("Ça ne sert à rien d'insister.")
		global.etat.p7_coneParle = 4
	}
	if global.etat.p7_coneParle = 2
	{
		DialogDef(6, 0, oConeParle)
		Dialog("...")
		global.etat.p7_coneParle = 3
	}
	if global.etat.p7_coneParle = 1
	{
		DialogDef(6, 0, oConeParle)
		Dialog("Allez, fais demi-tour !")
		global.etat.p7_coneParle = 2
	}
	if global.etat.p7_coneParle = 0
	{
		DialogDef(6, 0, oConeParle)
		Dialog("Désolé, tu ne peux pas traverser ce pont pour \nl'instant, il y a des travaux.")
		Dialog("Comment ça, c'est juste une excuse pour ne pas \nque tu puisses continuer sans être allé voir Nephor \ndans sa maison ?")
		Dialog("Je ne vois pas de quoi tu parles.")
		global.etat.p7_coneParle = 1
	}
}

// Musique

if oBarque.x = 3010
{
	Music_stop(2000)
}