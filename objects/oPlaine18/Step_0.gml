global.cinemaTimer++

if Interaction(oDeclencheurZone)
{
	DialogDef(6,0,0)
	Dialog("[Fenêtre haut]")
}
if Interaction(oDeclencheurZone2)
{
	DialogDef(6,0,0)
	Dialog("[Fenêtre bas]")
}

if choix_etape = 1 && oMoniteurDialogue.actif = false && GetChoix() = 1
{
	if global.etat.p19_cinema1 = 0
	{
		Dialog("Ne devriez-vous pas d'abord demander au \npropriétaire du hamac ?")
	}else
	{
		Dialog("Hé ! Il faut payer d'abord !")
	}
	choix_etape = 0
}
if Interaction(oDeclencheurZone3)
{
	DialogDef(6,0,0)
	Dialog("C'est un hamac.  \nVoulez-vous vous coucher dedans ?")
	Choix(["Oui", "Non"])
	choix_etape = 1
}
if Interaction(oDeclencheurZone4)
{
	DialogDef(6,0,oDragobert)
	if global.etat.p18_dragobertParlE = 1
	{
		Dialog("J'aurais pas dû laisser doudou à la maison.")
	}
	if global.etat.p18_dragobertParlE = 0
	{
		Dialog("Maman... J'ai peur... \nCette forêt est vraiment effrayante...")
		global.etat.p18_dragobertParlE = 1
	}
}

if Interaction(oDeclencheurZone5)
{
	DialogDef(6,0,0)
	if global.etat.p18_hamacTrouE = 0
	{
		Dialog("Ce hamac a l'air très mal fait.  \nIl risque de se déchirer si vous montez dedans.")
	}
	if global.etat.p18_hamacTrouE = 1
	{
		Dialog("Il s'est déchiré.")
	}
}

if Interaction(oDeclencheurZone6) && global.etat.p18_dialogOcheon = 0
{
	global.etat.p18_dialogOcheon = 1
	DialogDef(6,sOcheonTete,oOcheonHamac)
	Dialog("Oh, tu es là, méchant gars !")
	Dialog("Comme tu peux le voir, je prends une \npetite pause dans ce très confortable \nhamac. Eh oui, t'empêcher d'atteindre le \nchâteau est parfois épuisant.")
	Dialog("Mais, jusqu'ici, je pense que je me suis \nplutôt bien débrouillé pour ce qui est de \nte ralentir !")
	Dialog("Grâce à moi, le gentil diable aura tout le \ntemps qu'il lui faudra pour préparer \nle château à ton arrivée !")
	Dialog("Et sais-tu ce qui va encore plus te \nralentir que toutes mes autres \népreuves et subterfuges ?")
	Dialog("Ma prochaine énigme ! \nJ'en suis très fier ! \nTu la découvriras juste un peu plus loin \nà l'est.")
	Dialog("Quant à moi, il faut que j'aille préparer \nl'énigme suivante.")
	Dialog("Salut !")
}

if global.etat.p18_dialogOcheon = 1 && oMoniteurDialogue.actif = false
{
	global.etat.p18_dialogOcheon = 2
	global.cinema = true
	global.cinemaTimer = 0
}
if global.etat.p18_dialogOcheon = 2
{
	if global.cinemaTimer = 30
	{
		oOcheonHamac.sprite_index = sOcheonBasSaute2
		oOcheonHamac.image_index = 0
	}
	if global.cinemaTimer = 50
	{
		oOcheonHamac.image_index = 1
	}
	if global.cinemaTimer = 80
	{
		oOcheonHamac.sprite_index = sOcheonBasSaute
	}
	if global.cinemaTimer > 80 && global.cinemaTimer < 100
	{
		oOcheonHamac.y --
		oOcheonHamac.x += 0.5
	}
	if global.cinemaTimer > 99 && global.cinemaTimer < 112
	{
		oOcheonHamac.y -= 0.5
		oOcheonHamac.x += 0.5
	}
	if global.cinemaTimer > 111 && global.cinemaTimer < 125
	{
		oOcheonHamac.y += 0.5
		oOcheonHamac.x += 0.5
	}
	if global.cinemaTimer > 124 && global.cinemaTimer < 150
	{
		oOcheonHamac.y ++
		oOcheonHamac.x += 0.5
	}
	if global.cinemaTimer > 149 && global.cinemaTimer < 156
	{
		oOcheonHamac.y += 1.5
		oOcheonHamac.x += 0.25
	}
	if global.cinemaTimer > 156 && global.cinemaTimer < 160
	{
		oOcheonHamac.y ++
		oOcheonHamac.x += 0.25
	}
	if global.cinemaTimer = 160
	{
		oOcheonHamac.sprite_index = sOcheonBasSaute2
		oOcheonHamac.image_index = 0
	}
	if global.cinemaTimer = 168
	{
		oOcheonHamac.sprite_index = sOcheonBasSaute2
		oOcheonHamac.image_index = 1
	}
	if global.cinemaTimer = 180
	{
		oOcheonHamac.sprite_index = sOcheonBasSaute2
		oOcheonHamac.image_index = 0
	}
	if global.cinemaTimer = 210
	{
		oOcheonHamac.sprite_index = sOcheonDroite
		oOcheonHamac.image_index = 0
		oOcheonHamac.image_speed = 0
	}
	if global.cinemaTimer = 230
	{
		oOcheonHamac.sprite_index = sOcheonDroite
		oOcheonHamac.image_speed = 1
	}
	if global.cinemaTimer > 230
	{
		oOcheonHamac.image_speed = 1
		oOcheonHamac.x += 1.25
	}
	if global.cinemaTimer = 340
	{
		oOcheonHamac.visible = false
		global.cinema = false
		global.etat.p18_dialogOcheon = 3
	}
}

if Interaction(oDeclencheurZone6) && global.etat.p18_dialogOcheon = 3
{
	DialogDef(6,0,0)
	Dialog("Ce hamac est recouvert de poussière.")
}



if global.etat.p19_cinema1 = 3
{
	oJoueur.visible = false
	global.cinema = true
	global.cinemaTimer = 0
	global.etat.p19_cinema1 = 4
	oOnderDort.image_index = 0
}

if global.etat.p19_cinema1 = 3.1
{
	oJoueur.visible = false
	global.cinema = true
	global.cinemaTimer = 0
	global.etat.p19_cinema1 = 4.1
}

if global.etat.p19_cinema1 = 4
{
	if global.cinemaTimer = 360
	{
		oOnderDort.image_index = 1
	}
	if global.cinemaTimer = 480
	{
		oOnderDort.image_index = 2
	}
	if global.cinemaTimer = 560
	{
		global.etat.p19_cinema1 = 5
		GotoRoomDuration(Plaine1805, 100, 75, 240)
	}
}

if global.etat.p19_cinema1 = 4.1
{
	if global.cinemaTimer = 240
	{
		global.etat.p18_hamacTrouE = 0.5
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 260
	{
		global.etat.p18_hamacTrouE = 1
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 262
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 264
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 266
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 268
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 270
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 272
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 274
	{
		oOnderDort2.y += 1
	}
	if global.cinemaTimer = 480
	{
		global.etat.p18_lastHamac = 2
		global.etat.p19_cinema1 = 6
		GotoRoomDuration(Plaine19, 105, 97, 180)
	}
}