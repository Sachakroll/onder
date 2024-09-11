// Traversée du pont par le joueur

if (oJoueur.x > 382 && oJoueur.x < 473)
{
	if (oJoueur.x > 385 && oJoueur.x < 470)
	{
		if (oJoueur.x > 389 && oJoueur.x < 466)
		{
			if (oJoueur.x > 396 && oJoueur.x < 459)
			{
				if (oJoueur.x > 405 && oJoueur.x < 450)
				{
					sprite_set_offset(oJoueur.sprite_index, 6, 32)
				}else
				{
					sprite_set_offset(oJoueur.sprite_index, 6, 31)
				}
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

// Timer Alternant

timerAlternant++
if timerAlternant = 4
{
	timerAlternant = 0
}

timerAlternantEcroulement++
if timerAlternantEcroulement = 2
{
	timerAlternantEcroulement = 0
}

global.cinemaTimer++

// Évènements

if Interaction(oOurs)
{
	global.etat.p14_cinema1 = 0.5
	DialogDef(6, 0, 0)
	Dialog("Cet ours dort profondément.")
	Dialog("Il bloque complètement le chemin. \nVoulez-vous le pousser ?")
	Choix(["Oui", "Non"])
}

if global.etat.p14_cinema1 = 0.5 && oMoniteurDialogue.actif = false
{
	if GetChoix() = 1
	{
		global.etat.p14_cinema1 = 1
		global.cinemaTimer = 0
		global.cinema = true
		oJoueur.sprite_index = sOnderDroite
		timerAlternant = 0
	}
	if GetChoix() = 2
	{
		global.etat.p14_cinema1 = 0
	}
}

if global.etat.p14_cinema1 = 1
{
	if timerAlternant = 0
	{
		oJoueur.x ++
		oOurs.x ++
		oCamera.x ++
	}
	if global.cinemaTimer = 1
	{
		oJoueur.x --
	}
	if global.cinemaTimer = 330
	{
		oJoueur.x --
		global.etat.p14_cinema1 = 2
		global.cinemaTimer = 0
	}
}

if global.etat.p14_cinema1 = 2
{
	 if global.cinemaTimer = 100
	 {
		 oPlaine_Riviere4.image_index = 1
	 }
	 if global.cinemaTimer = 106
	 {
		 oPlaine_Riviere4.image_index = 2
		 oOurs.y++
	 }
	 if global.cinemaTimer = 112
	 {
		 oOurs.y++
	 }
	 if global.cinemaTimer = 200
	 {
		 oPlaine_Riviere4.image_index = 3
		 global.cinemaTimer = 0
		 global.etat.p14_cinema1 = 3
		 timerAlternantEcroulement = 1
	 }
}

if global.etat.p14_cinema1 = 3
{
	if timerAlternantEcroulement = 0
	{
		oPlaine_Riviere4.image_index++
	}
	if oPlaine_Riviere4.image_index > 6 && oPlaine_Riviere4.image_index < 18
	{
		oOurs.y++
	}
	if oPlaine_Riviere4.image_index = 16
	{
		oOurs.sprite_index = sOursFlotte
	}
	if oPlaine_Riviere4.image_index = 25
	{
		global.etat.p14_cinema1 = 4
		global.cinemaTimer = 0
	}
}

if (global.etat.p14_cinema1 = 3 && oPlaine_Riviere4.image_index > 18) || global.etat.p14_cinema1 = 4
{
	oOurs.y -= 0.25
}
if global.etat.p14_cinema1 = 4 && global.cinemaTimer > 45
{
	oOurs.x += 0.1
}

if global.etat.p14_cinema1 = 4 && global.cinemaTimer = 600
{
	global.etat.p14_cinema1 = 5
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 5
{
	if global.cinemaTimer < 80
	{
		oCamera.x++
	}
	if global.cinemaTimer = 140
	{
		global.etat.p14_cinema1 = 6
		global.cinemaTimer = 0
	}
}

if global.etat.p14_cinema1 = 6
{
	oBucheron.sprite_index = sBucheronGauche
	oBucheron.x -= 0.5
	if global.cinemaTimer = 106
	{
		global.etat.p14_cinema1 = 7
		global.cinemaTimer = 0
		oBucheron.sprite_index = sBucheronTresEtonne
	}
}

if global.etat.p14_cinema1 = 7
{
	if global.cinemaTimer = 60
	{
		global.etat.p14_cinema1 = 8
		oBucheron.sprite_index = sBucheronEtonne
		DialogDef(6, 0, oBucheron)
		Dialog("Oh !")
	}
}

if global.etat.p14_cinema1 = 8 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 9
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 9
{
	if global.cinemaTimer = 60
	{
		global.etat.p14_cinema1 = 10
		oBucheron.sprite_index = sBucheron
		DialogDef(6, 0, oBucheron)
		Dialog("Euh... Il n'est pas censé y avoir un pont ici ?")
		Dialog("Si, je m'en souviens très bien !")
		Dialog("...")
		Dialog("Bah, j'imagine qu'il va falloir que j'aille chercher \ndu bois pour réparer ça.")
	}
}

if global.etat.p14_cinema1 = 10 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 11
	global.cinemaTimer = 0
	oBucheron.sprite_index = sBucheronDroite
}

if global.etat.p14_cinema1 = 11
{
	oBucheron.x += 0.5
	if global.cinemaTimer = 106
	{
		global.etat.p14_cinema1 = 12
		global.cinemaTimer = 0
	}
}

if global.etat.p14_cinema1 = 12 && global.cinemaTimer = 200
{
	global.etat.p14_cinema1 = 13
	oBucheron.sprite_index = sBucheronGaucheBois
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 13
{
	oBucheron.x -= 0.5
	if global.cinemaTimer = 106
	{
		oBucheron.sprite_index = sBucheronBois
		global.etat.p14_cinema1 = 14
		global.cinemaTimer = 0
	}
}

if global.etat.p14_cinema1 = 14 && global.cinemaTimer = 40
{
	global.etat.p14_cinema1 = 15
	DialogDef(6, 0, oBucheron)
	Dialog("Voilà, j'ai du bois ! \nMaintenant, tu vas m'aider à réparer le pont !")
}

if global.etat.p14_cinema1 = 15 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 15.5
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 15.5 && global.cinemaTimer = 60
{
	global.etat.p14_cinema1 = 16
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 16
{
	if global.cinemaTimer = 42
	{
		oPlaine_mj1_cadre.sprite_index = sPlaine_mj1_cadre
	}
	if global.cinemaTimer = 160
	{
		global.etat.p14_cinema1 = 17
		DialogDef(6, 0, oBucheron)
		Dialog("Je vais t'envoyer des planches de bois. Essaye de \nles placer correctement dans ce rectangle en \nles bougeant de haut en bas.")
		Dialog("Mais attention, si tu laisses des trous dans le pont, \nil ne sera pas assez solide, donc il faudra tout \nrecommencer.")
		Dialog("Allez, on y va !")
	}
}

if global.etat.p14_cinema1 = 17 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 18
	global.cinemaTimer = 0
}
if global.etat.p14_cinema1 = 18
{
	if global.cinemaTimer < 16
	{
		oBucheron.x += 0.5
		oBucheron.y -= 0.5
	}
	if global.cinemaTimer = 40
	{
		global.etat.p14_cinema1 = 19
		oBucheron.sprite_index = sBucheronBois
		oPlaine_mj1.ordinal = 0
	}
}

// Après le mini-jeu

if global.etat.p14_cinema1 = 20
{
	oPlaine_mj1_cadre.sprite_index = sPlaine_mj1_cadre_disparition
	if global.cinemaTimer = 75
	{
		oPlaine_Riviere4.image_index = 0
	}
	if global.cinemaTimer = 168
	{
		oPlaine_mj1_cadre.visible = false
	}
	if global.cinemaTimer = 220
	{
		global.etat.p14_cinema1 = 21
		oBucheron.sprite_index = sBucheronBois
		DialogDef(6, 0, oBucheron)
		Dialog("Beau travail !")
		Dialog("Bon ! Moi, j'y vais. J'ai du pain sur la planche !")
	}
}

if global.etat.p14_cinema1 = 21 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 22
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 22
{
	oBucheron.sprite_index = sBucheronGaucheBois
	oBucheron.x --
	if global.cinemaTimer < 10
	{
		oBucheron.y++
	}
	if global.cinemaTimer > 240
	{
		oCamera.x--
	}
	if global.cinemaTimer = 260
	{
		oBucheron.visible = false
	}
	if global.cinemaTimer = 325
	{
		global.cinema = false
		global.etat.p14_cinema1 = 23
	}
}

// Défaite au mini-jeu

if global.etat.p14_cinema1 = 19.40 && ((global.cinemaTimer = 100 && compteurDefaite = 0) || (global.cinemaTimer = 70 && compteurDefaite >= 1))
{
	global.etat.p14_cinema1 = 19.41
	oBucheron.sprite_index = sBucheronBois
	DialogDef(6, 0, oBucheron)
	if compteurDefaite = 0
	{
		Dialog("Euh... Je t'avais dit de ne pas laisser de trous...")
		Dialog("Là, le pont est vraiment fragile. Il risque de \ns'écrouler à tout moment.")
	}
	if compteurDefaite = 1
	{
		Dialog("Ah. Encore perdu.   \nOn recommence !")
	}
	if compteurDefaite = 2
	{
		Dialog("Ah. Mince.   \nAllez, on recommence !")
	}
	if compteurDefaite = 3
	{
		Dialog("Mince, c'est si compliqué que ça ?   \nBon, on réssaye, d'accord ?")
	}
	if compteurDefaite = 4
	{
		Dialog("Encore ?     \nAllez, on réssaye encore une fois.")
	}
	if compteurDefaite = 5
	{
		Dialog("Tu es sûr que tu as bien compris ? Il faut bien \nremplir l'entièreté de ce rectangle blanc.")
		Dialog("Il ne faut pas laisser de trous que tu ne pourras \npas reboucher après.")
		Dialog("Bon, on recommence. Cette fois-ci sera la bonne !")
	}
	if compteurDefaite = 6
	{
		Dialog("...")
	}
	if compteurDefaite = 7
	{
		Dialog("Sérieusement ?")
	}
	if compteurDefaite = 8
	{
		Dialog("Tu fais exprès ou quoi ?")
		Dialog("J'ai pas que ça à faire, moi !")
	}
	if compteurDefaite = 9
	{
		Dialog("Pff...   \nQu'est-ce que tu essayes de faire ?")
	}
	if compteurDefaite = 10
	{
		Dialog("...")
	}
}

if global.etat.p14_cinema1 = 19.41 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 19.42
	global.cinemaTimer = 0
}
 
if global.etat.p14_cinema1 = 19.42 && global.cinemaTimer = 200
{
	if compteurDefaite = 10
	{
		global.etat.p14_cinema1 = 19.44
		global.cinemaTimer = 0
	}
	if compteurDefaite > 0 && compteurDefaite < 10
	{
		global.etat.p14_cinema1 = 19.44
		compteurDefaite ++
		global.cinemaTimer = 0
	}
	if compteurDefaite = 0
	{
		global.etat.p14_cinema1 = 19.43
		compteurDefaite = 1
		Dialog("C'est parti, on recommence !")
	}
}

if global.etat.p14_cinema1 = 19.43 && oMoniteurDialogue.actif = false
{
	global.etat.p14_cinema1 = 19.44
	global.cinemaTimer = 0
}

if global.etat.p14_cinema1 = 19.44 && global.cinemaTimer = 40
{
	global.etat.p14_cinema1 = 19
	oBucheron.sprite_index = sBucheronBois
	oPlaine_mj1.ordinal = 0
	oPlaine_mj1.timer = 180
	oPlaine_mj1.puzzle = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				          [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0]]

	oPlaine_mj1.phase = ""
	oPlaine_mj1.defaite_detectee = false
}