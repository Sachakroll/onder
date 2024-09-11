global.cinemaTimer++

if Interaction(oDeclencheurZone2)
{
	DialogDef(6,0,0)
	Dialog("C'est une carte de la forêt.  \nOn peut également y voir les montagnes qui \nentourent ce royaume.")
	Dialog("La croix rouge indique votre position actuelle.")
}

if oMoniteurDialogue.personnage = oPlaine19 && oMoniteurDialogue.actif
{
	sprite_index = sAubergeIntParle
}
else
{
	sprite_index = sAubergeInt
}

if Interaction(oDeclencheurZone) && global.etat.p19_cinema1 = 0
{
	global.etat.p19_cinema1 = 2
	DialogDef(6,0,oPlaine19)
	Dialog("Salutations, étranger.  \nJe suis Tournibou, maître de cette auberge.")
	if global.etat.pieces >= 12
	{
		Dialog("Une nuit ici vous coûtera douze pièces.\n\n(Vous avez : " + string(global.etat.pieces) + " pièces)")
	}else
	{
		global.etat.p19_hibouDonnEOffrePetitHamac = 1
		Dialog("Une nuit ici vous coûtera douze pièces.")
		Dialog("Oh, mais on dirait que vous en avez moins de \ndouze...")
		Dialog("Hmm... normalement, je ne laisse pas dormir ici \nles clients qui n'ont pas assez d'argent mais...  \nVous avez une bonne tête. Alors je vais vous faire \nune offre spéciale.")
		Dialog("Je vous laisse dormir gratuitement dans le plus \npetit de nos hamacs. Il n'est pas de très bonne \nqualité mais vous devriez tout de même réussir à \ndormir dedans.")
		Dialog("Alors ?")
	}
	Choix(["Rester", "Partir"])
}

if global.etat.p19_cinema1 = 2 && oMoniteurDialogue.actif = false
{
	if GetChoix() = 1
	{
		if global.etat.pieces >= 12
		{
			Dialog("D'accord. Passez une bonne nuit.")
			global.etat.p19_cinema1 = 2.5
			global.etat.pieces -= 12
		}else
		{
			Dialog("D'accord. Passez une bonne nuit...")
			global.etat.p19_cinema1 = 2.51
		}
		global.cinema = true
	}
	if GetChoix() = 2
	{
		global.etat.p19_cinema1 = 1
		Dialog("Très bien, comme vous voudrez.")
	}
}

if Interaction(oDeclencheurZone) && global.etat.p19_cinema1 = 1
{
	global.etat.p19_cinema1 = 2
	DialogDef(6,0,oPlaine19)
	Dialog("Salutations, étranger. Désirez-vous rester une nuit \nici ? Cela coûte toujours douze pièces.")
	if global.etat.pieces >= 12
	{
		Dialog("(Vous avez : " + string(global.etat.pieces) + " pièces)")
	}else
	{
		Dialog("Oh, mais on dirait que vous en avez moins de \ndouze...")
		if global.etat.p19_hibouDonnEOffrePetitHamac = 1
		{
			Dialog("Alors, voulez-vous dormir gratuitement dans le plus \npetit de nos hamacs ?")
		}else
		{
			global.etat.p19_hibouDonnEOffrePetitHamac = 1
			Dialog("Hmm... normalement, je ne laisse pas dormir ici \nles clients qui n'ont pas assez d'argent mais...  \nVous avez une bonne tête. Alors je vais vous faire \nune offre spéciale.")
			Dialog("Je vous laisse dormir gratuitement dans le plus \npetit de nos hamacs. Il n'est pas de très bonne \nqualité mais vous devriez tout de même réussir à \ndormir dedans.")
			Dialog("Alors ?")
		}
	}
	Choix(["Rester", "Partir"])
}

if global.etat.p19_cinema1 = 2.5 && oMoniteurDialogue.actif = false
{
	global.cinema = true
	global.etat.p19_cinema1 = 3
	GotoRoomDuration(Plaine18, 132, 373, 140)
}

if global.etat.p19_cinema1 = 2.51 && oMoniteurDialogue.actif = false
{
	global.cinema = true
	global.etat.p19_cinema1 = 3.1
	GotoRoomDuration(Plaine18, 394, 372, 180)
}

if global.etat.p19_cinema1 = 6
{
	global.cinemaTimer = 0
	global.etat.p19_cinema1 = 6.5
	oJoueur.visible = true
	oJoueur.sprite_index = sOnderHaut
	global.cinema = true
}

if global.etat.p19_cinema1 = 6.5 && global.cinemaTimer = 120
{
	global.etat.p19_cinema1 = 7
	DialogDef(6,0,oPlaine19)
	if global.etat.p18_lastHamac = 1
	{
		global.etat.pv = 10
		Dialog("Eh bien, on dirait que vous avez passé une très \nbonne nuit. Vous avez l'air en forme, \nvos PV sont même au maximum.")
		Dialog("Pour cela, vous pouvez remercier Tournibou !")
		Dialog("Au revoir, étranger.")
	}
	if global.etat.p18_lastHamac = 2
	{
		global.etat.pv = 1
		Dialog("Eh bien, on dirait que vous n'avez pas passé une \ntrès bonne nuit. Vos PV sont au plus bas.")
		Dialog("N'hésitez pas à vous rendre au point de sauvegarde \njuste ici à votre droite pour restaurer un peu votre \nsanté.")
		Dialog("Au revoir, étranger.")
	}
}

if global.etat.p19_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	global.etat.p19_cinema1 = 8
	global.cinema = false
}

if Interaction(oDeclencheurZone) && global.etat.p19_cinema1 = 8
{
	global.etat.p19_cinema1 = 9
	DialogDef(6,0,oPlaine19)
	Dialog("Salutations, étranger. Vous êtes de retour ? \nVoulez-vous rester une nuit ici ? \nCela coûte toujours douze pièces.")
	if global.etat.pieces >= 12
	{
		Dialog("(Vous avez : " + string(global.etat.pieces) + " pièces)")
	}else
	{
		Dialog("Oh, mais on dirait que vous en avez moins de \ndouze...")
		if global.etat.p19_hibouDonnEOffrePetitHamac = 1
		{
			if global.etat.p18_hamacTrouE = 1
			{
				Dialog("Malheureusement, notre plus petit hamac a été \ndéchiré. Je ne peux donc pas vous offrir une nuit \ndedans.")
				Dialog("Au revoir, étranger.")
				global.etat.p19_cinema1 = 8
			}else
			{
				Dialog("Alors, voulez-vous dormir gratuitement dans le plus \npetit de nos hamacs ?")
			}
		}else
		{
			global.etat.p19_hibouDonnEOffrePetitHamac = 1
			Dialog("Hmm... normalement, je ne laisse pas dormir ici \nles clients qui n'ont pas assez d'argent mais...  \nVous avez une bonne tête. Alors je vais vous faire \nune offre spéciale.")
			Dialog("Je vous laisse dormir gratuitement dans le plus \npetit de nos hamacs. Il n'est pas de très bonne \nqualité mais vous devriez tout de même réussir à \ndormir dedans.")
			Dialog("Alors ?")
		}
	}
	if global.etat.p19_cinema1 = 9
	{
		Choix(["Rester", "Partir"])
	}
}

if global.etat.p19_cinema1 = 9 && oMoniteurDialogue.actif = false
{
	if GetChoix() = 1
	{
		if global.etat.pieces >= 12
		{
			Dialog("D'accord. Passez une bonne nuit.")
			global.etat.p19_cinema1 = 2.5
			global.etat.pieces -= 12
		}else
		{
			Dialog("D'accord. Passez une bonne nuit...")
			global.etat.p19_cinema1 = 2.51
		}
		global.cinema = true
	}
	if GetChoix() = 2
	{
		global.etat.p19_cinema1 = 8
		Dialog("Très bien, comme vous voudrez.")
	}
}

show_debug_message(global.etat.p19_cinema1)