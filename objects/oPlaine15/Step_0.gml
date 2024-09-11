global.cinemaTimer++

// Panneau

if Interaction(oPanneau)
{
	DialogDef(6, 0, 0)
	Dialog("Attention ! Zone surveillée par Ocheon !")
}

// Coffre

if Interaction(oOcheonCoffre) && global.etat.p15_cinema1 = 0
{
	global.etat.p15_cinema1 = 0.5
	DialogDef(6, 0, 0)
	Dialog("C'est un coffre au trésor.")
	Dialog("Une voix étouffée semble provenir de l'intérieur\ndu coffre : «Psst !   Ouvre-moi !»")
	Choix(["L'ouvrir", "Ne pas l'ouvrir"])
}

if global.etat.p15_cinema1 = 0.5 && oMoniteurDialogue.actif = false
{
	if GetChoix() = 1
	{
		global.etat.p15_cinema1 = 1
		global.cinema = true
		global.cinemaTimer = 0
		oOcheonCoffre.sprite_index = sOcheonCoffre_ouverture
		oOcheonCoffre.image_speed = 1
	}
	if GetChoix() = 2
	{
		Dialog("Vous entendez à nouveau la voix provenant \ndu coffre : «Tu ne sais pas ce que tu rates !»")
		global.etat.p15_cinema1 = 0
	}
}

if global.etat.p15_cinema1 = 1 && global.cinemaTimer = 300
{
	global.etat.p15_cinema1 = 2
	oOcheonCoffre.sprite_index = sOcheonCoffre_parle
	global.cinemaTimer = 0
}

if global.etat.p15_cinema1 = 2 && global.cinemaTimer = 80
{
	global.etat.p15_cinema1 = 3
	DialogDef(6, sOcheonTete, oOcheonCoffre)
	Dialog("Bouh !")
	Dialog("Ha ha ! Je t'ai bien eu ! Je parie que tu\nes si effrayé que tu vas déguerpir à \ntoute vitesse dans un instant !")
	Dialog("...")
	DialogDef(6, sOcheonTeteHm, oOcheonCoffre)
	Dialog(".....")
	DialogDef(6, sOcheonTeteNeutre, oOcheonCoffre)
	Dialog("Je savais que j'aurais dû crier «bouh» \nplus fort...")
}

if global.etat.p15_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	global.etat.p15_cinema1 = 4
	global.cinemaTimer = 0
	oOcheonCoffre.sprite_index = sOcheonCoffre_sort
}

if global.etat.p15_cinema1 = 4 && global.cinemaTimer = 52
{
	global.etat.p15_cinema1 = 5
	oOcheonCoffre.sprite_index = sOcheonCoffre_ouvert
	oOcheon.visible = true
	oOcheon.x = 228
	oOcheon.y = 256
	oOcheon.sprite_index = sOcheonBasSaute
	oOcheonCoffre_couvercle.y -= 6
	global.cinemaTimer = 0
}

if global.etat.p15_cinema1 = 5
{
	oOcheon.y--
	oOcheonCoffre_couvercle.y -= 1.25
	if global.cinemaTimer = 120
	{
		global.etat.p15_cinema1 = 6
		global.cinema = false
	}
}

if Interaction(oOcheonCoffre) && global.etat.p15_cinema1 = 6
{
	DialogDef(6, 0, 0)
	Dialog("Il ne reste plus que de la poussière à l'intérieur \ndu coffre.")
}