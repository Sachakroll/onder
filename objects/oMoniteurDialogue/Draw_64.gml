if actif == true
{
	// Affichage du cadre
	if room = Mort
	{
		draw_sprite(sCadreDialogueMort, 0, window_get_width() / 2, window_get_height() - decalageCadreY);
	}else
	{
		draw_sprite(sCadreDialogue, 0, window_get_width() / 2, window_get_height() - decalageCadreY);
	}
	
	// Affichage du texte (mode normal)
	if (modeChoix == false)
	{
		// Décalage du texte ?
		if (sprite == 0)
		{
			decalageTexteX = 0
		}
		else
		{
			decalageTexteX = 128
		}
	
		// Affichage du texte
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_set_font(font);
		texte_x = (window_get_width() - sprite_get_width(sCadreDialogue)) / 2 + decalageTexteX + margeX
		texte_y = window_get_height() - decalageCadreY - sprite_get_height(sCadreDialogue) + margeY
		texte_partiel = string_copy(texte, 0, lettres);
		draw_text(texte_x, texte_y, texte_partiel);
	
		// Affichage du sprite
		if (sprite != 0)
		{
			draw_sprite(sprite, bouche, texte_x - decalageTexteX, texte_y + 16)
		}
	}
	
	// Affichage des choix
	if (modeChoix)
	{
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_set_font(font);
		decalageTexteX = 32
		
		for (i = 0; i < array_length(listeChoix); i++) {
			// Affichage du texte
			texte_x = (window_get_width() - sprite_get_width(sCadreDialogue)) / 2 + decalageTexteX + margeX
			texte_y = window_get_height() - decalageCadreY - sprite_get_height(sCadreDialogue) + margeY
			
			if (i == 1 || i == 3)
			{
				texte_x = texte_x + 256
			}
			
			if (i == 2 || i == 3)
			{
				texte_y = texte_y + 64
			}
			
			draw_text(texte_x, texte_y, listeChoix[i]);
			
			if (choixActuel - 1 == i)
			{
				draw_sprite(sChoixActif, 0, texte_x - decalageTexteX, texte_y)
			}
			else
			{
				draw_sprite(sChoixInactif, 0, texte_x - decalageTexteX, texte_y)
			}
		}
	}
	
	// Affichage de l'inventaire
	
	if global.inventaireOuvert
	{
		draw_sprite(sCadreStats, 0, window_get_width() / 2, window_get_height() - decalageCadreY - 74);
		draw_text(120, 416 - 74, "Pièces : " + string(global.etat.pieces))
		draw_text(120 + sprite_get_width(sCadreStats) / 2 - 16, 416 - 74, "Points de vie : " + string(global.etat.pv) + "/" + string(global.pvMax))
	}
}