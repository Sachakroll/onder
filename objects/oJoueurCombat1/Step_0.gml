if (keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_escape)) 
&& global.inventaireOuvertCombat = 1 && oMoniteurDialogue.actif = 1
&& (oMoniteurDialogue.defilementEnCours = false || oGlobal.GetInvSize() == 0)
{
	global.inventaireOuvertCombat = 0
	oMoniteurDialogue.actif = false
	sortieInventaire = 1
}

if global.combat1CanMove = 1 && global.inventaireOuvertCombat = 0
{
	key_left = keyboard_check(vk_left)
	key_right = keyboard_check(vk_right)
	if oCombat1.joueurTouche = 0
	{
		key_enter = keyboard_check_pressed(vk_enter)
		if key_enter = 0
		{
			key_enter = keyboard_check_pressed(ord("Z"))
		}
	}
	
	hsp = (key_right - key_left) * movesp
	
	if x + hsp > 48 && x + hsp < 752
	x += hsp
	
	// Coups
	
	if key_enter && coup = 0
	{
		coup = 1
	}
}
	
	// Animations
	
if oCombat1.joueurTouche !=0
{
	if oCombat1.joueurTouche > 14
	{
		sprite_index = sOnderCombat1_touche
		image_index = 0
	}
	if oCombat1.joueurTouche <= 14
	{
		sprite_index = sOnderCombat1_touche
		image_index = 1
	}
}else
{
	if hsp != 0 && coup = 0
	{
		if timerAnimation = 0
		{
			sprite_index = sOnderCombat1
			image_index = 0
		}
		if timerAnimation = 10
		{
			sprite_index = sOnderCombat1
			image_index = 1
		}
		if timerAnimation = 20
		{
			sprite_index = sOnderCombat1
			image_index = 2
		}
		if timerAnimation = 30
		{
			sprite_index = sOnderCombat1
			image_index = 3
		}
	}
	if coup > 0
	{
		if coup = 1
		{
			sprite_index = sOnderCombat1
			image_index = 4
		}
		if coup = 8
		{
			sprite_index = sOnderCombat1
			image_index = 5
		}
		if coup = 12
		{
			sprite_index = sOnderCombat1
			image_index = 6
		}
		if coup = 16
		{
			sprite_index = sOnderCombat1
			image_index = 7
		}
	}
	if hsp = 0 && coup = 0
	{
		sprite_index = sOnderCombat1
		image_index = 0
	}
}

if oMoniteurDialogue.actif = true || (global.combat1CanMove = false && oCombat1.mort = false)
{
	sprite_index = sOnderCombat1
	image_index = 0
}

if oCombat1.mort = true && timerMort = 0
{
	timerMort = 1
}
if timerMort > 0
{
	timerMort ++
}

if timerMort > 1 && timerMort < 20
{
	sprite_index = sOnderCombat1_touche
	image_index = 0
}
if timerMort > 20 && timerMort < 30
{
	sprite_index = sOnderCombat1_touche
	image_index = 2
}
if timerMort >= 30
{
	sprite_index = sOnderCombat1_touche
	image_index = 3
}


if global.inventaireOuvertCombat = 0
{
	timerAnimation++
	if timerAnimation = 40
	{
		timerAnimation = 0
	}

	if coup > 0
	{
		coup++
		if coup = 25
		{
			coup = 0
		}
	}
}

if global.combat1CanMove = true
{
	if keyboard_check_pressed(ord("I")) && global.inventaireOuvertCombat = 0 && oMoniteurDialogue.actif = 0 && sortieInventaire = 0
	{
		if GetInvSize() = 0
		{
			DialogDef(6, 0, 0)
			Dialog("L'inventaire est vide.")
			global.inventaireOuvertCombat = 1
			oMoniteurDialogue.choix = 0
			etapeInventaire = 0
		} else
		{
			Choix(global.etat.inventaire)
			global.inventaireOuvertCombat = 1
			etapeInventaire = 1
		}
	}
	if global.inventaireOuvertCombat && oMoniteurDialogue.actif = false && etapeInventaire = 1
	{
		etapeInventaire = 2
		objetSelectionne = GetChoix()
		Choix(["Utiliser", "Examiner", "Jeter"])
	}
	
	if global.inventaireOuvertCombat && oMoniteurDialogue.actif = false && etapeInventaire = 2
	{
		etapeInventaire = 3
		choixActionInventaire = GetChoix()
		oGlobal.Utiliser(choixActionInventaire, objetSelectionne)
	}
	
	if global.inventaireOuvertCombat && oMoniteurDialogue.actif = false && etapeInventaire = 3
	{
		etapeInventaire = 0
		global.inventaireOuvertCombat = 0
	}
	
	if oMoniteurDialogue.actif = false && global.inventaireOuvertCombat = 1
	{
		global.inventaireOuvertCombat = 0
	}
}

sortieInventaire = 0