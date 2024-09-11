if oMoniteurDialogue.actif == true && !global.cinema {
	if (keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_escape)) 
	&& global.inventaireOuvert = 1 && oMoniteurDialogue.actif = 1
	&& (oMoniteurDialogue.defilementEnCours = false || oGlobal.GetInvSize() == 0)
	{
		global.inventaireOuvert = 0
		oMoniteurDialogue.actif = false
		sortieInventaire = 1
	}
}

tempsTimer ++
if tempsTimer = 60
{
	tempsTimer = 0
	global.etatPersistant.temps ++
	show_debug_message(global.etatPersistant.temps)
}

if oMoniteurDialogue.actif == false && !global.cinema
{
	// Récupérer les touches du clavier
	
	key_left = keyboard_check(vk_left)
	key_right = keyboard_check(vk_right)
	key_up = keyboard_check(vk_up)
	key_down = keyboard_check(vk_down)
	
	// Vitesse de course
	
	if (keyboard_check(vk_space) == 1)
	{
		movesp = runsp
	}
	if (keyboard_check(vk_space) == 0)
	{
		movesp = walksp
	}
	if global.debugmode && keyboard_check(vk_backspace)
	{
		movesp = debugsp
	}
	
	// Mouvements du joueur
	
	moveH = key_right - key_left
	hsp = moveH * movesp

	moveV = key_down - key_up
	vsp = moveV * movesp
	
	
	i = 0
	while (i < 2)
	{
		if oMasqueCollision.collisionDeplacement(x+hsp, y, oCollision1) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oCollision2) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oCollision3) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oNephor) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oPlaine6_Arbuste) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oSauvegarde) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oLevier) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oPanneau) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oPanneauOiseaux) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oCone) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oConeParle) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oOurs) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oStand_Peche) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oEdwar_le_forrain) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oOcheonCollision) 
		|| oMasqueCollision.collisionDeplacement(x+hsp, y, oMurLevier) 
		{
			if hsp > 0 {
				hsp -= 1
			}
			if hsp < 0 {
				hsp += 1
			}
		}
		if oMasqueCollision.collisionDeplacement(x, y+vsp, oCollision1) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oCollision2) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oCollision3) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oNephor) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oPlaine6_Arbuste) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oSauvegarde) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oLevier) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oPanneau) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oPanneauOiseaux) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oCone) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oConeParle) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oOurs) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oStand_Peche) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oEdwar_le_forrain) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oOcheonCollision) 
		|| oMasqueCollision.collisionDeplacement(x, y+vsp, oMurLevier) 
		{
			if vsp > 0 {
				vsp -= 1
			}
			if vsp < 0 {
				vsp += 1
			}
		}
		
		i++
	}
	
	x += hsp
	y += vsp
	
	// Animations du joueur
	
	if hsp == 0 && vsp == 0
	{
		image_index = 0
		image_speed = 0
	}
	else
	{
		if (movesp == walksp)
		{
			image_speed = 3
		}
		if (movesp == runsp)
		{
			image_speed = 5
		}
	}
	
	if key_right && !key_left
	{
		sprite_index = sOnderDroite
	}
	if key_left && !key_right
	{
		sprite_index = sOnderGauche
	}
	if key_up && !key_down
	{
		sprite_index = sOnderHaut
	}
	if key_down && !key_up
	{
		sprite_index = sOnderBas
	}
	
	// Inventaire
	
	if keyboard_check_pressed(ord("I")) && global.inventaireOuvert = 0 && oMoniteurDialogue.actif = 0 && sortieInventaire = 0
	{
		if GetInvSize() = 0
		{
			DialogDef(6, 0, 0)
			Dialog("L'inventaire est vide.")
			global.inventaireOuvert = 1
			oMoniteurDialogue.choix = 0
			etapeInventaire = 0
		} else
		{
			Choix(global.etat.inventaire)
			global.inventaireOuvert = 1
			etapeInventaire = 1
		}
	}
	if global.inventaireOuvert && oMoniteurDialogue.actif = false && etapeInventaire = 1
	{
		etapeInventaire = 2
		objetSelectionne = GetChoix()
		Choix(["Utiliser", "Examiner", "Jeter"])
	}
	
	if global.inventaireOuvert && oMoniteurDialogue.actif = false && etapeInventaire = 2
	{
		etapeInventaire = 3
		choixActionInventaire = GetChoix()
		oGlobal.Utiliser(choixActionInventaire, objetSelectionne)
	}
	
	if global.inventaireOuvert && oMoniteurDialogue.actif = false && etapeInventaire = 3
	{
		etapeInventaire = 0
		global.inventaireOuvert = 0
	}
	
	if oMoniteurDialogue.actif = false && global.inventaireOuvert = 1
	{
		global.inventaireOuvert = 0
	}
	
	// Portes
	
	if room == Plaine1
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine2, 10, y)
		}
	}
	
	if room == Plaine2
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine1, 550, y)
		}
		if place_meeting(x, y, oDeclencheur3)
		{
			GotoRoomDuration(Plaine3, 40, 368, 60)
			global.p2_cinema1 = 1
		}
	}
	
	if room == Plaine3
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine4, 10, y)
		}
	}
	
	if room == Plaine4
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine3, 262, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine5, 10, y)
		}
	}
	
	if room == Plaine5
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine4, 390, y)
		}
		if place_meeting(x, y, oDeclencheur2)
		{
			GotoRoom(Plaine6, 99, 136)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine7, 10, 712)
		}
	}
	
	if room == Plaine6
	{
		if global.etat.p6_cinema1 != 23 && place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine5, 248, 378)
		}
		if global.etat.p6_cinema1 = 23 && oJoueur.collision(oPorte1)
		{
			DialogDef(6, sNephorTeteJoyeux, oNephor)
			Dialog("Au revoir !")
			global.etat.p6_cinema1 = 23.5
		}
		if global.etat.p6_cinema1 = 23.5 && oMoniteurDialogue.actif = false
		{
			global.etat.p6_cinema1 = 24
			GotoRoom(Plaine5, 248, 378)
		}
	}
	
	if room == Plaine7
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine5, 502, 392)
		}
	}
	
	if room == Plaine9
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine10, 10, y)
		}
	}
	
	if room == Plaine10
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine9, 342, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine12, 10, y)
		}
	}
	
	if room == Plaine12
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine10, 694, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine11, 10, y+112)
		}
	}
	
	if room = Plaine11
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine12, 694, y-112)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine13, 10, y+160)
		}
	}
	
	if room = Plaine13
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine11, 262, y-160)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine14, 10, y-112)
		}
	}
	
	if room = Plaine14
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine13, 422, y+112)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine15, 10, y)
		}
	}
	
	if room = Plaine15
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine14, 694, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine16, 10, y)
		}
	}
	
	if room = Plaine16
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine15, 358, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine17demo, 10, y)
		}
	}
	
	if room = Plaine17demo
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine16, 774, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine18, 10, y + 112)
		}
	}
	
	if room = Plaine18
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine17demo, 486, y - 112)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine20, 10, y)
		}
		if place_meeting(x, y, oDeclencheur2)
		{
			GotoRoom(Plaine19, 61, 138)
		}
	}
	
	if room = Plaine19
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine18, 287, 347)
		}
	}
	
	if room = Plaine20
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine18, 614, y)
		}
		if place_meeting(x, y, oPorte2)
		{
			GotoRoom(Plaine21, 10, y-480)
		}
	}
	
	if room = Plaine21
	{
		if place_meeting(x, y, oPorte1)
		{
			GotoRoom(Plaine20, 678, y+480)
		}
		if place_meeting(x, y, oPorte2)
		{
			
		}
	}
}

if oMoniteurDialogue.actif || (global.cinema && global.cinemaJoueurBouge = 0)
{
	image_index = 0
	image_speed = 0
}

if cMov && global.cinema
{
	if cDir = "droite" && cTimer <= cPix
	{
		sprite_index = sOnderDroite
		x++
	}
	if cDir = "gauche" && cTimer <= cPix
	{
		sprite_index = sOnderGauche
		x--
	}
	if cDir = "haut" && cTimer <= cPix
	{
		sprite_index = sOnderHaut
		y--
	}
	if cDir = "bas" && cTimer <= cPix
	{
		sprite_index = sOnderBas
		y++
	}
	
	if cTimer = cPix
	{
		cMov = 0
		image_index = 0
		image_speed = 0
	}
}

sortieInventaire = 0