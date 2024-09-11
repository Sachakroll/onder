if oJoueur.collision(oDeclencheur2) && global.etat.p6_cinema1 = 0
{
	global.etat.p6_cinema1 = 1
	global.cinema = true
	global.cinemaTimer = 0
	oJoueur.sprite_index = sOnderHaut
	oNephor.sprite_index = sNephorHautParle
}

if global.etat.p6_cinema1 = 1
{
	global.cinemaTimer++
	if global.cinemaTimer = 40
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Installe-toi, c'est prêt.")
		global.etat.p6_cinema1 = 2
	}
}

if global.etat.p6_cinema1 = 2 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 3
	global.cinemaJoueurBouge = 1
	oJoueur.sprite_index = sOnderGauche
	oJoueur.image_speed = 3
}

if global.etat.p6_cinema1 = 3
{
	oJoueur.x--
	if oJoueur.x <= 64
	{
		global.etat.p6_cinema1 = 4
		oJoueur.sprite_index = sOnderHaut
	}
}

if global.etat.p6_cinema1 = 4
{
	oJoueur.y = oJoueur.y - 0.5
	if oJoueur.y <= 98
	{
		global.etat.p6_cinema1 = 5
		oJoueur.sprite_index = sOnderGauche
	}
}

if global.etat.p6_cinema1 = 5
{
	oJoueur.x = oJoueur.x - 0.4
	if oJoueur.x <= 44
	{
		global.etat.p6_cinema1 = 6
		oJoueur.sprite_index = sOnderHaut
	}
}

if global.etat.p6_cinema1 = 6
{
	oJoueur.y = oJoueur.y - 0.25
	if oJoueur.y <= 87
	{
		global.etat.p6_cinema1 = 7
		global.cinemaTimer = 0
		oJoueur.visible = false
		oJoueur.image_speed = 0
		global.cinemaJoueurBouge = 0
		image_index = 1
	}
}

if global.etat.p6_cinema1 = 7
{
	global.cinemaTimer++
	if global.cinemaTimer = 30
	{
		global.etat.p6_cinema1 = 8
		global.cinemaTimer = 0
	}
}

if global.etat.p6_cinema1 = 8
{
	global.cinemaTimer++
}

if global.etat.p6_cinema1 = 8 && global.cinemaTimer < 50
{
	oNephor.cin = 1
	oNephor.sprite_index = sNephorBasPlats
	oNephor.image_speed = 3
	oNephor.y = oNephor.y + 0.5
}

if global.etat.p6_cinema1 = 8 && global.cinemaTimer > 50
{
	oNephor.sprite_index = sNephorGauchePlats
	oNephor.image_speed = 3
	oNephor.x = oNephor.x - 0.5
}

if global.etat.p6_cinema1 = 8 && global.cinemaTimer = 114
{
	global.etat.p6_cinema1 = 9
	oNephor.cin = 0
	oNephor.visible = 0
	image_index = 2
	oNephor.sprite_index = sNephorBas
	oNephor.image_speed = 0
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 9
{
	global.cinemaTimer++
	if global.cinemaTimer = 90
	{
		image_index = 3
	}
	if global.cinemaTimer = 140
	{
		image_index = 4
	}
	if global.cinemaTimer = 190
	{
		image_index = 5
	}
	if global.cinemaTimer = 240
	{
		image_index = 6
	}
	if global.cinemaTimer = 290
	{
		image_index = 7
	}
	if global.cinemaTimer = 340
	{
		image_index = 8
	}
	if global.cinemaTimer = 390
	{
		image_index = 9
	}
	if global.cinemaTimer = 480
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Alors, comment t'appelles-tu ?")
		global.etat.p6_cinema1 = 10
		Choix(["Onder"])
		Dialog("Et d'où viens-tu ? \nDu château peut-être ?")
		Choix(["Je ne sais pas", "Des montagnes", "D'un autre monde"])
	}
}

choix = GetChoix()

if global.etat.p6_cinema1 = 10 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 11
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 11
{
	global.cinemaTimer++
}

if global.etat.p6_cinema1 = 11 && global.cinemaTimer = 20
{
	global.etat.p6_cinema1 = 12
	if choix = 1
	{
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Tu ne sais pas ?   \nÉtrange, tout ça...")
		DialogDef(3, sNephorTeteHm2, oNephor)
		Dialog("...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Mais, le chemin d'où tu viens...")
		Dialog("J'y suis déjà allé plusieurs fois, je sais \nque c'est un cul-de-sac. Il y a juste une \npetite chute d'eau qui coule des \nmontagnes...")
		Dialog("Tu n'es quand même pas descendu \npar là, si ?")
	}
	
	if choix = 2
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Des montagnes ? C'est ça, laisse-moi \nrire ! Personne n'irait habiter là-haut.")
		Dialog("J'ai déjà été y faire un tour il y a une \nvingtaine d'années...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("J'ai pas été bien loin, mais il faisait \ndéjà un froid de canard.    \nJ'ai dû rebrousser chemin.")
		DialogDef(3, sNephorTeteHm2, oNephor)
		Dialog("...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Mais, au fait, le chemin d'où tu viens...")
		Dialog("J'y suis déjà allé plusieurs fois, je sais \nque c'est un cul-de-sac. Il y a juste une \npetite chute d'eau qui coule...  \ndes montagnes, justement...")
		Dialog("Tu n'es quand même pas descendu \npar là, si ?")
	}
	
	if choix = 3
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("D'un autre monde ? C'est ça, \nlaisse-moi rire !")
		DialogDef(3, sNephorTeteHm2, oNephor)
		Dialog("...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Mais, au fait, le chemin d'où tu viens...")
		Dialog("J'y suis déjà allé plusieurs fois, je sais \nque c'est un cul-de-sac. Il y a juste une \npetite chute d'eau qui coule des \nmontagnes...")
		Dialog("Tu n'es quand même pas descendu \npar là, si ?")
	}
}

if global.etat.p6_cinema1 = 12 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 13
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 13
{
	global.cinemaTimer++
	if global.cinemaTimer = 60
	{
		global.etat.p6_cinema1 = 14
		if choix = 1
		{
			DialogDef(3, sNephorTeteHm2, oNephor)
			Dialog("Hmm...")
			DialogDef(6, sNephorTeteNeutre, oNephor)
			Dialog("Mais tu sais, tout ça...   \nça me fait penser à cette légende, \nou plutôt...   \ncette prophétie...")
		}
		if choix = 2
		{
			DialogDef(3, sNephorTeteHm2, oNephor)
			Dialog("Hmm...")
			DialogDef(6, sNephorTeteNeutre, oNephor)
			Dialog("Mais tu sais, tout ça...   \nça me fait penser à cette légende, \nou plutôt...   \ncette prophétie...")
		}
		if choix = 3
		{
			DialogDef(3, sNephorTeteHm2, oNephor)
			Dialog("Hmm...")
			DialogDef(6, sNephorTeteNeutre, oNephor)
			Dialog("En même temps, ça me fait penser \nà cette légende, \nou plutôt...   \ncette prophétie...")
		}
		
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Celle qu'on nous apprend à l'école.")
		Dialog("Ça dit qu'il y aurait d'autres royaumes \nen dehors de celui où on vit...")
		Dialog("Ça raconte aussi qu'un jour, \nquelqu'un qui vient d'un autre royaume \ntraverserait les montagnes et viendrait \nnous sauver.")
		Dialog("Nous sauver de quoi ?     \nÇa, j'en sais rien.")
		DialogDef(3, sNephorTeteHm2, oNephor)
		Dialog("...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Moi j'y crois pas trop mais bon...")
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Si c'est vrai, c'est peut-être toi...     \nQui sait ?")
	}
}

if global.etat.p6_cinema1 = 14 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 15
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 15
{
	global.cinemaTimer++
	if global.cinemaTimer = 90
	{
		image_index = 13
	}
	if global.cinemaTimer = 140
	{
		image_index = 14
	}
	if global.cinemaTimer = 190
	{
		image_index = 13
	}
	if global.cinemaTimer = 240
	{
		image_index = 14
	}
	if global.cinemaTimer = 290
	{
		image_index = 13
	}
	if global.cinemaTimer = 340
	{
		image_index = 15
	}
	if global.cinemaTimer = 390
	{
		image_index = 16
	}
	if global.cinemaTimer = 500
	{
		global.etat.p6_cinema1 = 16
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Alors, c'était bon ?")
		Choix(["Oui", "Non"])
	}
}

choix = GetChoix()

if global.etat.p6_cinema1 = 16 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 17
	if choix = 1
	{
		Dialog("Merci !")
		Dialog("C'est entièrement fait maison ! \nTous les ingrédients sont frais et \nviennent directement de ma ferme.")
	}
	if choix = 2
	{
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Ah, pardon...")
		Dialog("En même temps, je ne connais pas \nassez tes goûts.")
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Sache quand même que c'est \nentièrement fait maison. Tous les \ningrédients sont frais et viennent \ndirectement de ma ferme.")
	}
}

if global.etat.p6_cinema1 = 17 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 18
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 18
{
	global.cinemaTimer++
	if global.cinemaTimer = 90
	{
		global.etat.p6_cinema1 = 19
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Ah oui, j'oubliais...")
		Dialog("Le roi a mis en place une nouvelle loi \ndepuis peu.")
		Dialog("Toute personne originaire d'un autre \nroyaume qui arrive dans le nôtre doit \nse rendre au château.")
		Dialog("Je trouve quand même ça bizarre, \nune loi comme ça alors qu'on ne sait \nmême pas s'il existe vraiment d'autres \nroyaumes...")
		Dialog("En plus, je n'ai aucune idée d'à quoi \nelle sert...")
		DialogDef(3, sNephorTeteHm2, oNephor)
		Dialog("...")
		Dialog("Hmm...")
		DialogDef(6, sNephorTeteNeutre, oNephor)
		Dialog("Je ne sais pas d'où tu viens vraiment \nmais...  Dans le doute, je te conseille \nd'aller au château.")
		Dialog("Si tu continues vers l'est à travers la \nforêt pendant assez longtemps, tu \ndevrais arriver au village de la forêt...")
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("C'est là qu'habite mon fils d'ailleurs.")
		Dialog("Le château se trouve juste un peu plus \nloin à l'est.")
	}
}

if global.etat.p6_cinema1 = 19 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 20
	global.cinemaTimer = 0
}

if global.etat.p6_cinema1 = 20
{
	global.cinemaTimer++
	if global.cinemaTimer = 90
	{
		global.etat.p6_cinema1 = 21
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Bon, je ne te retiens pas plus \nlongtemps, tu peux t'en aller si tu \nveux.")
		Dialog("Si tu en as envie, tu peux aussi rester \nencore un peu, ça ne me dérange pas.")
	}
}

if global.etat.p6_cinema1 = 21 && oMoniteurDialogue.actif = false
{
	global.etat.p6_cinema1 = 22
	global.cinemaTimer = 0
	image_index = 20
	oNephor.visible = true
	oNephor.sprite_index = sNephorBas
	oNephor.y = 98
}

if global.etat.p6_cinema1 = 22
{
	global.cinemaTimer++
	if global.cinemaTimer < 112
	{
		oNephor.cin = 1
		oNephor.sprite_index = sNephorGauche
		oNephor.image_speed = 3
		oNephor.x = oNephor.x - 0.25
	}
	if global.cinemaTimer > 112 && global.cinemaTimer < 120
	{
		oNephor.sprite_index = sNephorHaut
		oNephor.image_speed = 3
		oNephor.y = oNephor.y - 0.25
	}
	if global.cinemaTimer = 120
	{
		oNephor.cin = 0
	}
	if global.cinemaTimer = 160
	{
		image_index = 1
		oNephor.sprite_index = sNephorHautPlats
	}
	if global.cinemaTimer > 200 && global.cinemaTimer < 280
	{
		oNephor.cin = 1
		oNephor.sprite_index = sNephorDroitePlats
		oNephor.image_speed = 3
		oNephor.x = oNephor.x + 0.75
	}
	if global.cinemaTimer > 280 && global.cinemaTimer < 350
	{
		oNephor.sprite_index = sNephorHautPlats
		oNephor.image_speed = 3
		oNephor.y = oNephor.y - 0.5
	}
	if global.cinemaTimer = 350
	{
		oNephor.cin = 0
	}
	if global.cinemaTimer = 380
	{
		oNephor.sprite_index = sNephorHaut
	}
	if global.cinemaTimer = 400
	{
		oNephor.sprite_index = sNephorBasParle
	}
	if global.cinemaTimer = 420
	{
		image_index = 0
		oJoueur.visible = true
		oJoueur.sprite_index = sOnderBas
		oJoueur.y = 100
		global.cinema = false
		global.etat.p6_cinema1 = 23
	}
}


if oMoniteurDialogue.actif && oMoniteurDialogue.personnage == oNephor && (global.etat.p6_cinema1 = 10 || global.etat.p6_cinema1 = 12 || global.etat.p6_cinema1 = 14 || global.etat.p6_cinema1 = 16 || global.etat.p6_cinema1 = 17 || global.etat.p6_cinema1 = 19 || global.etat.p6_cinema1 = 21)
{
	if global.etat.p6_cinema1 < 15
	{
		if oMoniteurDialogue.sprite = sNephorTeteHm2
		{
			image_index = 11
		}
	
		if oMoniteurDialogue.sprite = sNephorTeteNeutre
		{
			if oMoniteurDialogue.bouche == 1
			{
				image_index = 12
			}
			else
			{
				image_index = 11
			}
		}
	
		if oMoniteurDialogue.sprite = sNephorTeteJoyeux
		{
			if oMoniteurDialogue.bouche == 1
			{
				image_index = 10
			}
			else
			{
				image_index = 9
			}
		}
	}else
	{
		if oMoniteurDialogue.sprite = sNephorTeteHm2
		{
			image_index = 18
		}
	
		if oMoniteurDialogue.sprite = sNephorTeteNeutre
		{
			if oMoniteurDialogue.bouche == 1
			{
				image_index = 19
			}
			else
			{
				image_index = 18
			}
		}
	
		if oMoniteurDialogue.sprite = sNephorTeteJoyeux
		{
			if oMoniteurDialogue.bouche == 1
			{
				image_index = 17
			}
			else
			{
				image_index = 16
			}
		}
	}
}

if global.etat.p6_cinema1 > 22 && Interaction(oPlaine6_Arbuste)
{
	DialogDef(6, sNephorTeteJoyeux, oNephor)
	Dialog("C'est mon arbre de compagnie.   \nIl est très calme.")
}

if global.etat.p6_cinema1 > 22 && Interaction(oDeclencheurZone)
{
	DialogDef(8, 0, 0)
	Dialog("Cette porte est verrouillée.")
	DialogDef(6, sNephorTeteJoyeux, oNephor)
	Dialog("C'est la porte qui mène à la réserve. \nJ'y entrepose les récoltes et certains \noutils.")
}

if global.etat.p6_cinema1 > 22 && Interaction(oNephor)
{
	if global.avoirparleNephor = 1
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Alors, qu'est-ce que tu attends ?")
	}
	if global.avoirparleNephor = 0
	{
		DialogDef(6, sNephorTeteJoyeux, oNephor)
		Dialog("Alors, qu'est-ce que tu attends pour \naller au château ?")
		global.avoirparleNephor = 1
	}
}

if global.etat.p6_cinema1 > 22 && Interaction(oDeclencheurZone2)
{
	DialogDef(6, 0, 0)
	Dialog("Vous regardez par la fenêtre.")
	Dialog("Au loin, derrière la forêt, vous pouvez apercevoir \nles montagnes que vous avez traversées.")
}

if global.etat.p6_cinema1 > 22 && Interaction(oDeclencheurZone3)
{
	DialogDef(6, 0, 0)
	Dialog("Ce sont les outils de Nephor.")
}