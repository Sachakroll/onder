global.cinemaTimer++

if oJoueur.collision(oDeclencheur1) && global.etat.p17_cinema1 = 0
{
	global.etat.p17_cinema1 = 1
	global.cinema = true
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 1
{
	if global.cinemaTimer < 25
	{
		oCamera.x++
	}
	if global.cinemaTimer = 16
	{
		oJoueur.sprite_index = sOnderHaut
	}
	if global.cinemaTimer = 70
	{
		global.etat.p17_cinema1 = 2
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_parle
		DialogDef(6, 0, oGuideTouristique_foret)
		Dialog("Salut !   \nC'est moi, le guide touristique de la forêt !")
		Dialog("Et oui ! J'aurais dû être le guide touristique du \nchâteau mais la place était malheureusement déjà \nprise...")
		Dialog("Mais ce n'est pas grave ! J'ai tout de même la \ndeuxième région la plus intéressante des quatre \ngrandes régions !")
		Dialog("Et en tant que meilleur guide touristique des deux, \nje me suis beaucoup renseigné sur la forêt. \nJe la connais par coeur !!")
		Dialog("Hmm...")
		Dialog("Tu n'as pas l'air d'ici, ce qui implique que je vais \nêtre obligé de te faire le plaisir de te la présenter \nen détail !")
		Dialog("Alors...    \nPar où commencer ?")
		Dialog("Ah oui ! La forêt contient 42 chiogres...etc.")
		Dialog("Voilà, c'est tout pour cette courte présentation de \nla région ! \nMais... je peux lire sur ton visage cette envie d'en \napprendre davantage.")
		Dialog("Veux-tu vraiment que je t'explique tout cela plus \nen détail ?")
		Choix(["Non !", "SURTOUT PAS !", "oui"])
	}
}

if global.etat.p17_cinema1 = 2 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 3
	if GetChoix() = 1
	{
		Dialog("Pardon ? Je ne t'ai pas bien entendu. \nTu as dit : «oui», c'est ça ?")
	}
	if GetChoix() = 2
	{
		Dialog("Pardon ? Je ne t'ai pas bien entendu. \nTu as dit : «absolument», c'est ça ?")
	}
	Dialog("Parfait !")
	Dialog("Je vais donc continuer mes explications.     \nAlors... Où en étais-je ?")
}

if global.etat.p17_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 4
	oOcheonLettre.x = 374
	oOcheonLettre.y = 233
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 4
{
	oOcheonLettre.x --
	oOcheonLettre.image_angle += 6
	if global.cinemaTimer = 100
	{
		global.etat.p17_cinema1 = 5
		global.cinemaTimer = 0
		oOcheonLettre.x = 0
		oOcheonLettre.y = 0
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_lettre1
	}
}

if global.etat.p17_cinema1 = 5 && global.cinemaTimer = 40
{
	global.etat.p17_cinema1 = 5.5
	Dialog("Oh ! Une lettre ! Je vais l'ouvrir dès maintenant, \npeut-être que c'est important.")
}

if global.etat.p17_cinema1 = 5.5 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 6
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 6
{
	if global.cinemaTimer = 20
	{
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_lettre2
	}
	if global.cinemaTimer = 60
	{
		global.etat.p17_cinema1 = 7
		Dialog("Il est écrit : \n«Attention ! Vous devez vous rendre au village \nd'urgence en raison d'une vente de poussière de \ntrès haute qualité !»")
		Dialog("«Ne traînez pas, il n'y en aura pas pour tout le \nmonde !»")
		Dialog("Tiens donc ! Une vente de poussière ? \nQu'est-ce que c'est que ça encore ?")
		Dialog("...")
		Dialog("Il faut que j'aille voir ça.")
	}
}

if global.etat.p17_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 8
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 8
{
	oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_bouge
	oGuideTouristique_foret.x += 0.5
	if global.cinemaTimer = 320
	{
		oGuideTouristique_foret.x = 0
		oGuideTouristique_foret.y = 0
		global.etat.p17_cinema1 = 9
		global.cinemaTimer = 0
	}
}

if global.etat.p17_cinema1 = 9
{
	oOcheon.sprite_index = sOcheonGuideGauche
	oOcheon.x--
	if global.cinemaTimer = 110
	{
		oOcheon.sprite_index = sOcheonGuideBasParle
		global.etat.p17_cinema1 = 10
		global.cinemaTimer = 0
	}
}

if global.etat.p17_cinema1 = 10 && global.cinemaTimer = 60
{
	global.etat.p17_cinema1 = 11
	DialogDef(6, sOcheonTete, oOcheon)
	Dialog("Hé hé ! Salut ! \nC'est encore moi, le guide touristique !")
	Dialog("Il y a quelque chose que j'avais oublié \nde te dire...")
	Dialog("...")
	Dialog("En fait le chemin à l'est est bloqué, \ndonc à la place il faudra prendre \nun détour qui se trouve très très loin \nà l'ouest.")
	Dialog("Alors je te conseille de partir à l'ouest \ndès maintenant !")
	Dialog("Voilà.    \nSalut !")
}

if global.etat.p17_cinema1 = 11 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 12
	global.cinemaTimer = 0
	oOcheon.sprite_index = sOcheonGuideDroite
}

if global.etat.p17_cinema1 = 12
{
	oOcheon.x++
	if global.cinemaTimer > 90
	{
		oCamera.x--
	}
	if global.cinemaTimer = 120
	{
		global.cinema = false
		global.etat.p17_cinema1 = 13
		oOcheon.visible = false
		oGuideTouristique_foret.visible = false
	}
}

if Interaction(oGuideTouristique_foret_stand) && global.etat.p17_cinema1 = 13
{
	DialogDef(6,0,0)
	Dialog("Le stand du guide touristique.")
	Dialog("Il est en carton.")
}