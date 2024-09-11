if keyboard_check_pressed(vk_space)
{
	lettres = string_length(texte)
	defilementEnCours = false
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && defilementEnCours == false && actif
{
	global.can_speak = false
	oJoueur.alarm[0] = 20
	if modeChoix
	{
		choix = choixActuel
	}
	
	if nombreDeTextesEnAttente == 0
	{
		actif = false
	}
	else
	{
		modeChoix = prochainsTextes[0][0]
		
		if (modeChoix == false)
		{
			texte = prochainsTextes[0][1];
			vitesse = prochainsTextes[0][2];
			sprite = prochainsTextes[0][3];
			personnage = prochainsTextes[0][4];
		
			lettres = 0
			defilementEnCours = true
			vitesseDefilement = vitesseDefilementBase * 5 / vitesse
			alarm[0] = vitesseDefilement
		
			if (sprite != 0 && sprite_get_number(sprite) > 1)
			{
				alarm[1] = vitesseBouche
			}
			if personnage != 0
			{
				alarm[1] = vitesseBouche
			}
		}
		
		if (modeChoix)
		{
			listeChoix = prochainsTextes[0][1]
			choixActuel = 1
		}
		
		nombreDeTextesEnAttente = nombreDeTextesEnAttente - 1;
		array_delete(prochainsTextes, 0, 1);
	}
}

nombreChoix = array_length(listeChoix)

if modeChoix && nombreChoix = 4
{
	if keyboard_check_pressed(vk_left)
	{
		if (choixActuel == 2 || choixActuel == 4)
		{
			choixActuel = choixActuel - 1
		}
	}
	
	if keyboard_check_pressed(vk_right)
	{
		if (choixActuel == 1 || choixActuel == 3)
		{
			choixActuel = choixActuel + 1
		}
	}
	
	if keyboard_check_pressed(vk_up)
	{
		if (choixActuel == 3 || choixActuel == 4)
		{
			choixActuel = choixActuel - 2
		}
	}
	
	if keyboard_check_pressed(vk_down)
	{
		if (choixActuel == 1 || choixActuel == 2)
		{
			choixActuel = choixActuel + 2
		}
	}
}

if modeChoix && nombreChoix = 3
{
	if keyboard_check_pressed(vk_left)
	{
		if (choixActuel == 2)
		{
			choixActuel = choixActuel - 1
		}
	}
	
	if keyboard_check_pressed(vk_right)
	{
		if (choixActuel == 1)
		{
			choixActuel = choixActuel + 1
		}
	}
	
	if keyboard_check_pressed(vk_up)
	{
		if (choixActuel == 3)
		{
			choixActuel = choixActuel - 2
		}
	}
	
	if keyboard_check_pressed(vk_down)
	{
		if (choixActuel == 1)
		{
			choixActuel = choixActuel + 2
		}
	}
}

if modeChoix && nombreChoix = 2
{
	if keyboard_check_pressed(vk_left)
	{
		if (choixActuel == 2)
		{
			choixActuel = choixActuel - 1
		}
	}
	
	if keyboard_check_pressed(vk_right)
	{
		if (choixActuel == 1)
		{
			choixActuel = choixActuel + 1
		}
	}
}