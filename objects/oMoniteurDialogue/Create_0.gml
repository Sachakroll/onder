function afficher(message)
{
	if (actif == false)
	{
		actif = true
		modeChoix = false
		texte = message
		lettres = 0
		defilementEnCours = true
		vitesseDefilement = vitesseDefilementBase * 5 / def_vitesse
		sprite = def_sprite
		personnage = def_personnage
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
	else
	{
		prochainsTextes[nombreDeTextesEnAttente] = [false, message, def_vitesse, def_sprite, def_personnage]
		nombreDeTextesEnAttente = nombreDeTextesEnAttente + 1
	}
}

function definir(_vitesse, _sprite, _personnage)
{
	def_vitesse = _vitesse
	def_sprite = _sprite
	def_personnage = _personnage
}

function afficherChoix(liste_choix)
{
	liste_copie = []
	dernierChoixValide = 0
	for (i = 0; i < array_length(liste_choix); i++) {
		if liste_choix[i] != "" {
			dernierChoixValide = i + 1
		}
	}
	array_copy(liste_copie, 0, liste_choix, 0, dernierChoixValide);
	
	if (actif == false)
	{
		actif = true
		modeChoix = true
		listeChoix = liste_copie
		choixActuel = 1
		choix = 0
	}
	else
	{
		prochainsTextes[nombreDeTextesEnAttente] = [true, liste_copie]
		nombreDeTextesEnAttente = nombreDeTextesEnAttente + 1
	}
}

actif = false
decalageTexteX = 0
decalageCadreY = 32
margeX = 40
margeY = 40
font = Font
texte = ""
lettres = 0
defilementEnCours = false
vitesseDefilementBase = room_speed / 18
vitesseDefilement = vitesseDefilementBase
vitesseBouche = vitesseDefilement * 3

sprite = 0
personnage = 0
bouche = 0

prochainsTextes = []
nombreDeTextesEnAttente = 0

def_vitesse = 0
def_sprite = 0
def_personnage = 0

modeChoix = false
listeChoix = []
choixActuel = 1
choix = 0