if global.inventaireOuvertCombat = 0
{
	global.cinemaTimer++
}

if global.etat.p8_cinema1 = 6 && global.cinemaTimer = 80
{
	oPiounocchioCombat.sprite_index = sPiounocchioCombatParle
	global.etat.p8_cinema1 = 7
	DialogDef(6, 0, oPiounocchioCombat)
	Dialog("Euh...")
	Dialog("C'est la première fois que tu te retrouves dans \nun combat, c'est ça ?")
	Dialog("Bon, je vais t'expliquer alors.")
	Dialog("Tu vois cette barre blanche en haut à droite ?\nC'est ta barre de vie.")
	Dialog("Le nombre à côté de cette barre indique tes points \nde vie. Quand ils sont à zéro, tu meurs.")
	Dialog("...")
	Dialog("Ah oui, et aussi...  \nSi tu appuies sur I, ton inventaire s'ouvre.")
	Dialog("Mais, tu ne peux pas le faire pendant que je parle, \nce serait très impoli de me couper la parole.")
	Dialog("C'est bon, tu as compris ?")
	Dialog("C'est parti, maintenant je vais pouvoir te \nfaire payer tes actes !")
	Dialog("Piou, à l'attaque !")
}

if global.etat.p8_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	oPiounocchioCombat.sprite_index = sPiounocchioCombat1
	oPiounocchioCombat.image_speed = 1
	global.etat.p8_cinema1 = 8
	global.combat1CanMove = 1
	global.cinemaTimer = 0
}

if global.inventaireOuvertCombat = 0
{
	if global.etat.p8_cinema1 = 8 && global.cinemaTimer = 80
	{
		global.etat.p8_cinema1 = 9
	}

	if global.etat.p8_cinema1 = 9 && phase = ""
	{
		// Cinématique terminée, début du combat
		Music_change(mPiouCombat, 1000, 61)
		phase = "descente"
		
		global.etatPersistant.combat1atteint = true
	}

	if phase = "descente"
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		if descenteX = 0
		{
			descenteX = random(736) + 32
			descenteY = 212
		}
	
		oPiouCombat.plonger(descenteX, descenteY, 5)
	
		if oPiouCombat.y >= descenteY
		{
			descenteX = 0
			phase = "descente2"
		}
	}

	if phase = "descente2"
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		if descenteX = 0
		{
			descenteX = random(736) + 32
			descenteY = 312
		}
		oPiouCombat.plonger(descenteX, descenteY, 6)
		
		if oPiouCombat.y >= descenteY
		{
			descenteX = 0
			phase = "attaque"
		}
	}

	if phase = "attaque"
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.plonger(oJoueurCombat1.x - 26 ,oJoueurCombat1.y - 120, 7)
	
		if oJoueurCombat1_rame.collision(oPiouCombat) && oJoueurCombat1.coup >= 6
		{
			phase = "ejection"
		}
		else if oJoueurCombat1.collision(oPiouCombat)
		{
			phase = "repli"
			if joueurTouche = 0
			{
				global.etat.pv -= 2
				joueurTouche = 30
			}
		}
		else if oPiouCombat.y >= oJoueurCombat1.y + 80
		{
			phase = "repli"
		}
	}

	if phase = "repli"
	{
		oPiouCombat.sprite_index = sPiouCombat_repli
		oPiouCombat.plonger(456, 92, 4.5)
	
		if oPiouCombat.y <= 92
		{
			oPiouCombat.x = 456
			oPiouCombat.y = 92
			phase = "pose"
			timerPose = 0
		}
	}

	if phase = "retour"
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.plonger(456, 92, 2)
	
		if oPiouCombat.y >= 92
		{
			oPiouCombat.x = 456
			oPiouCombat.y = 92
			phase = "pose"
			timerPose = 0
		}
	}

	if phase = "pose"
	{
		oPiouCombat.sprite_index = sPiouCombat_pose
		timerPose++
		if timerPose = 80
		{
			phase = "descente"
		}
	}

	if phase = "ejection"
	{
		if oPiouCombat.x > 332 && oPiouCombat.x < 444
		{
			phase = ""
			if global.etat.p8_cinema1 = 9
			{
				global.etat.p8_cinema1 = 10
			}
			if global.etat.p8_cinema1 = 14
			{
				global.etat.p8_cinema1 = 15
				oiseauxActif = false
			}
			if global.etat.p8_cinema1 = 19
			{
				global.etat.p8_cinema1 = 20
				oiseauxActif = false
			}
		}
		if global.etat.p8_cinema1 = 24 && oPiouCombat.x > 316 && oPiouCombat.x < 462
		{
			global.etat.p8_cinema1 = 25
		}
		
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.image_angle += 32
		oPiouCombat.y -= 20
	
		if oPiouCombat.y < -80
		{
			phase = "retour"
			oPiouCombat.image_angle = 0
		}
	}

	if joueurTouche > 0
	{
		joueurTouche --
	}

	if global.etat.p8_cinema1 = 9
	{
		oPiounocchioCombat.sprite_index = sPiounocchioCombat1
		oPiounocchioCombat.image_speed = 1
	}
}

if global.etat.p8_cinema1 = 10
{
	oPiouCombat.sprite_index = sPiouCombat_vol
	oPiouCombat.image_angle += 32
	oPiouCombat.y -= 20
	
	oPiounocchioCombat.sprite_index = sPiounocchioCombat2
	if oPiouCombat.y <= 150
	{
		global.etat.p8_cinema1 = 11
		global.combat1CanMove = 0
	}
}

if global.etat.p8_cinema1 = 11
{
	if oPiouCombat.y <= 680
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.image_angle -= 32
		oPiouCombat.y += 20
		oPiouCombat.x -= 4
	} else
	{
		global.etat.p8_cinema1 = 12
		global.cinemaTimer = 0
	}
}

if global.etat.p8_cinema1 = 12 && global.cinemaTimer = 80
{
	global.etat.p8_cinema1 = 13
	oPiounocchioCombat.sprite_index = sPiounocchioCombat2Parle
	DialogDef(6,0, oPiounocchioCombat)
	Dialog("Tu croyais vraiment m'avoir comme ça ?")
	Dialog("J'ai un bouclier ! Et il est très résistant ! \nTu ne pourrais pas le briser même si tu \nenvoyais Piou sur moi encore deux fois.")
	Dialog("Piou, à l'attaque ! \nLes autres oiseaux, venez aussi nous aider !")
}

if global.etat.p8_cinema1 = 13 && oMoniteurDialogue.actif = false
{
	global.etat.p8_cinema1 = 14
	global.combat1CanMove = true
	phase = "repli"
	oPiounocchioCombat.sprite_index = sPiounocchioCombat2b
	oPiouCombat.image_angle = 0
	oiseauxActif = true
	phaseOiseaux = 1
}


if global.etat.p8_cinema1 = 15
{
	oPiouCombat.sprite_index = sPiouCombat_vol
	oPiouCombat.image_angle += 32
	oPiouCombat.y -= 16
	
	oPiounocchioCombat.sprite_index = sPiounocchioCombat2
	if oPiouCombat.y <= 150
	{
		oPiounocchioCombat.sprite_index = sPiounocchioCombat3
		global.etat.p8_cinema1 = 16
		global.combat1CanMove = 0
	}
}

if global.etat.p8_cinema1 = 16
{
	if oPiouCombat.y <= 680
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.image_angle -= 32
		oPiouCombat.y += 20
		oPiouCombat.x -= 4
	} else
	{
		global.etat.p8_cinema1 = 17
		global.cinemaTimer = 0
	}
}

if global.etat.p8_cinema1 = 17 && global.cinemaTimer = 80
{
	global.etat.p8_cinema1 = 18
	oPiounocchioCombat.sprite_index = sPiounocchioCombat3Parle
	DialogDef(6,0, oPiounocchioCombat)
	Dialog("Quoi ? Tu recommences ?")
	Dialog("Tu sais très bien que ça ne sert à rien !")
	Dialog("Regarde, mon bouclier n'a pas du tout été abîmé \npar...")
	Dialog("Euh...")
	Dialog("Oublie ça ! \nLes oiseaux, à l'attaque !")
}

if global.etat.p8_cinema1 = 18 && oMoniteurDialogue.actif = false
{
	global.etat.p8_cinema1 = 19
	global.combat1CanMove = true
	phase = "repli"
	oPiounocchioCombat.sprite_index = sPiounocchioCombat3b
	oPiouCombat.image_angle = 0
	oiseauxActif = true
	phaseOiseaux = 2
}

// Cassage du bouclier

if global.etat.p8_cinema1 = 20
{
	oPiouCombat.sprite_index = sPiouCombat_vol
	oPiouCombat.image_angle += 32
	oPiouCombat.y -= 16
	
	oPiounocchioCombat.sprite_index = sPiounocchioCombat3
	if oPiouCombat.y <= 150
	{
		oPiounocchioCombat.sprite_index = sPiounocchioCombat4
		global.etat.p8_cinema1 = 21
		explosionBouclier = 1
		global.combat1CanMove = 0
	}
}

if global.etat.p8_cinema1 = 21
{
	if oPiouCombat.y <= 680
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.image_angle -= 32
		oPiouCombat.y += 20
		oPiouCombat.x -= 4
	} else
	{
		global.etat.p8_cinema1 = 22
		global.cinemaTimer = 0
	}
}

if global.etat.p8_cinema1 = 22 && global.cinemaTimer = 100
{
	global.etat.p8_cinema1 = 23
	oPiounocchioCombat.sprite_index = sPiounocchioCombat4Parle
	DialogDef(6,0, oPiounocchioCombat)
	Dialog("Ah...")
	Dialog("...")
	Dialog("Peu importe...")
	Dialog("On va faire comme si ça n'était jamais arrivé...")
	Dialog("Allez, Piou...")
	Dialog("À l'attaque...")
}

if global.etat.p8_cinema1 = 23 && oMoniteurDialogue.actif = false
{
	global.etat.p8_cinema1 = 24
	global.combat1CanMove = true
	phase = "repli"
	oPiounocchioCombat.sprite_index = sPiounocchioCombat5
	oPiouCombat.image_angle = 0
}

// Expulsion de Piounocchio

if global.etat.p8_cinema1 = 25
{
	oPiouCombat.sprite_index = sPiouCombat_vol
	oPiouCombat.image_angle += 32
	oPiouCombat.y -= 16
	
	oPiounocchioCombat.sprite_index = sPiounocchioCombat5
	if oPiouCombat.y <= 150
	{
		oPiounocchioCombat.sprite_index = sPiounocchioCombat5
		global.etat.p8_cinema1 = 26
		global.combat1CanMove = 0
	}
}

if global.etat.p8_cinema1 = 26
{
	if oPiouCombat.y <= 680
	{
		oPiouCombat.sprite_index = sPiouCombat_vol
		oPiouCombat.image_angle -= 32
		oPiouCombat.y += 24
		oPiouCombat.x -= 4
	} else
	{
		global.etat.p8_cinema1 = 27
		global.cinemaTimer = 0
		Music_stop(2000)
	}
}

if global.etat.p8_cinema1 = 26 || global.etat.p8_cinema1 = 27
{
	oPiounocchioCombat.sprite_index = sPiounocchioCombat5
	oPiounocchioCombat.image_angle += 48
	oPiounocchioCombat.y -= 12
	oPiounocchioCombat.x += 4
}

if global.etat.p8_cinema1 = 27 && global.cinemaTimer = 140
{
	global.etat.p8_cinema1 = 28
	GotoRoom(Plaine9, 183, 280)
	global.cinema = false
	oJoueur.visible = true
}

if explosionBouclier > 0
{
	explosionBouclier ++
	if explosionBouclier = 60
	{
		explosionBouclier = 0
	}
}

// Mort

if global.etat.pv = 0 && mort = 0
{
	Music_stop(1000)
	mort = 1
	global.combat1CanMove = 0
	GotoRoomDuration(Mort, 0, 0, 100)
}

// Autres oiseaux

positionOiseau = random(629) + 48
if positionOiseau > 321
{
	positionOiseau += 107
}

if global.inventaireOuvertCombat = 0
{
	timerOiseaux++
	if timerOiseaux = 400
	{
		timerOiseaux = 0
	}	
}

if oiseauxActif = true && phaseOiseaux = 1 && global.inventaireOuvertCombat = false
{
	if timerOiseaux = 50 || timerOiseaux = 250
	{
		oOiseauCombat1.lancer(positionOiseau, -80)
	}
	if timerOiseaux = 150 || timerOiseaux = 350
	{
		oOiseauCombat2.lancer(positionOiseau, -80)
	}
}

if oiseauxActif = true && phaseOiseaux = 2 && global.inventaireOuvertCombat = false
{
	if timerOiseaux = 0 || timerOiseaux = 198
	{
		oOiseauCombat1.lancer(positionOiseau, -80)
	}
	if timerOiseaux = 66 || timerOiseaux = 264
	{
		oOiseauCombat2.lancer(positionOiseau, -80)
	}
	if timerOiseaux = 132 || timerOiseaux = 330
	{
		oOiseauCombat3.lancer(positionOiseau, -80)
	}
}

// Être touché par les autres oiseaux

if joueurTouche = 0 && global.combat1CanMove = true && global.etat.pv > 0 && delaiToucheOiseau = 0 
&& (oJoueurCombat1.collision(oOiseauCombat1) || oJoueurCombat1.collision(oOiseauCombat2) || oJoueurCombat1.collision(oOiseauCombat3))
{
	global.etat.pv -= 2
	joueurTouche = 30
	delaiToucheOiseau = 50
}

if delaiToucheOiseau > 0
{
	delaiToucheOiseau --
}