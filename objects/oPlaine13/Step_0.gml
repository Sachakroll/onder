global.cinemaTimer++

if oJoueur.collision(oDeclencheur1) && global.etat.p13_cinema1 = 0
{
	global.cinema = true
	global.cinemaTimer = 0
	global.etat.p13_cinema1 = 1
}

if global.etat.p13_cinema1 = 1
{
	oCamera.x++
	if global.cinemaTimer = 40
	{
		global.etat.p13_cinema1 = 2
		global.cinemaTimer = 0
	}
}

if global.etat.p13_cinema1 = 2
{
	if global.cinemaTimer > 80
	{
		oOcheonCastor.x -= 0.5
		oOcheonCastor.sprite_index = sOcheonCastor
		oOcheonCastor.image_speed = 1
	}
	if global.cinemaTimer = 274
	{
		global.etat.p13_cinema1 = 3
		global.cinemaTimer = 0
	}
}

if global.etat.p13_cinema1 = 3
{
	oOcheonCastor.y -= 0.25
	oOcheonCastor.sprite_index = sOcheonCastor
	oOcheonCastor.image_speed = 0.5
	if global.cinemaTimer = 32
	{
		global.etat.p13_cinema1 = 4
		global.cinemaTimer = 0
		oOcheonCastor.sprite_index = sOcheonCastorMange
		oOcheonCastor.image_index = 0
		oOcheonCastor.image_speed = 1
		oOcheon.sprite_index = sOcheonTroncAnimation
		oOcheon.image_index = 0
		oOcheon.image_speed = 1
	}
}

if global.etat.p13_cinema1 = 4 && global.cinemaTimer = 419
{
	global.etat.p13_cinema1 = 5
	global.cinemaTimer = 0
	oOcheonCastor.sprite_index = sOcheonCastor
	oOcheonCastor.image_index = 0
	oOcheonCastor.image_speed = 0
	oOcheon.sprite_index = sOcheonTroncAnimation2
	oOcheon.image_index = 0
	oOcheon.image_speed = 0
}

if global.etat.p13_cinema1 = 5 && global.cinemaTimer = 80
{
	global.etat.p13_cinema1 = 6
	oOcheon.sprite_index = sOcheonTroncCrie
	oOcheon.image_index = 0
	oOcheon.image_speed = 0
	DialogDef(6, sOcheonTeteCrie, oOcheon)
	Dialog("AAAAAAAAAAAH !!!")
}

if global.etat.p13_cinema1 = 6 && oMoniteurDialogue.actif = false
{
	global.etat.p13_cinema1 = 7
	global.cinemaTimer = 0
}

if global.etat.p13_cinema1 = 7
{
	oOcheonCastor.sprite_index = sOcheonCastor
	oOcheonCastor.image_speed = 1
	if global.cinemaTimer < 32
	{
		oOcheon.sprite_index = sOcheonTroncSort
		oOcheon.image_index = 0
		oOcheon.image_speed = 0
		oOcheonCastor.y += 0.25
	}
	if global.cinemaTimer < 64
	{
		oOcheonCastor.x += 0.25
		if global.cinemaTimer > 32
		{
			oOcheon.sprite_index = sOcheonTroncSort
			oOcheon.image_index = 1
			oOcheon.image_speed = 0
		}
	}
	if global.cinemaTimer = 64
	{
		oOcheonCastor.sprite_index = sOcheonCastor
		oOcheonCastor.image_speed = 0
		global.etat.p13_cinema1 = 8
		global.cinemaTimer = 0
		oOcheon.sprite_index = sOcheonTroncSort
		oOcheon.image_index = 2
		oOcheon.image_speed = 0
	}
}

if global.etat.p13_cinema1 = 8 && global.cinemaTimer = 60
{
	global.etat.p13_cinema1 = 9
	global.cinemaTimer = 0
	oOcheon.sprite_index = sOcheonTroncDroite
	oOcheon.image_index = 0
	oOcheon.image_speed = 1
}

if global.etat.p13_cinema1 = 9
{
	if global.cinemaTimer < 32
	{
		oOcheon.y += 0.25
		if global.cinemaTimer > 16
		{
			oOcheon.x += 0.5
		}
	}
	if global.cinemaTimer > 32
	{
		oOcheon.x += 0.5
		oOcheonCastor.sprite_index = sOcheonCastorDroite
		oOcheonCastor.image_speed = 1
		oOcheonCastor.x ++
	}
	if global.cinemaTimer = 60
	{
		oOcheon.sprite_index = sOcheonTroncDroiteParle
		global.etat.p13_cinema1 = 10
		DialogDef(6, sOcheonTeteEnerve, oOcheon)
		Dialog("Reviens ici, sale bête !")
		Dialog("Tu as complétement saboté mon plan !")
		Dialog("Je comptais parler au méchant gars \nquand il arriverait devant moi...")
		Dialog("Ainsi, grâce à mon déguisement, il \ncroirait entendre un arbre parler et \ns'enfuirait loin d'ici !")
		Dialog("Ce qu'il ne saurait pas, c'est qu'il \ns'agit en réalité de moi, Ocheon, \nparfaitement déguisé.")
		Dialog("Mais malheureusement, ce plan avait \nune seule faille...")
		Dialog("Ce castor de malheur !")
	}
}

if global.etat.p13_cinema1 > 9 && global.cinema = true
{
	oOcheonCastor.sprite_index = sOcheonCastorDroite
	oOcheonCastor.image_speed = 1
	oOcheonCastor.x ++
}

if global.etat.p13_cinema1 = 10 && oMoniteurDialogue.actif = false
{
	global.etat.p13_cinema1 = 11
	global.cinemaTimer = 0
}

if global.etat.p13_cinema1 = 11
{
	oOcheon.sprite_index = sOcheonTroncDroite
	oOcheon.image_speed = 1
	oOcheon.x++
	if global.cinemaTimer > 149
	{
		oCamera.x--
	}
	if global.cinemaTimer = 200
	{
		oOcheon.x = 600
		oOcheon.visible = false
		global.etat.p13_cinema1 = 12
		global.cinema = false
	}
}

if Interaction(oDeclencheurZone) && global.etat.p13_objPris = 0
{
	global.etat.p13_objPris = 0.5
	DialogDef(6, 0, 0)
	Dialog("C'est tout ce qu'il reste du déguisement d'Ocheon.")
	Choix(["Le ramasser", "Le laisser"])
}

choix = GetChoix()

if global.etat.p13_objPris = 0.5 && oMoniteurDialogue.actif = false
{
	if choix = 1
	{
		DialogDef(6, 0, 0)
		if AddInv("Bout déguisement") = false
		{
			Dialog("Vous n'avez pas assez de place dans votre \ninventaire.")
			global.etat.p13_objPris = 0
		}else
		{
			Dialog("Vous ramassez le bout de déguisement.")
			global.etat.p13_objPris = 1
		}
	}else
	{
		global.etat.p13_objPris = 0
	}
}