global.cinemaTimer++

if oJoueur.collision(oDeclencheurZone) && global.etat.p22_cinema1 = 0
{
	global.etat.p22_cinema1 = 1
	global.cinema = true
	global.cinemaTimer = 0
	initial_campos = oCamera.x
	Music_stop(1000)
}
if global.etat.p22_cinema1 = 1
{
	oCamera.x ++
	if global.cinemaTimer >= (157-initial_campos)
	{
		global.etat.p22_cinema1 = 2
		global.cinemaTimer = 0
	}
}
if global.etat.p22_cinema1 = 2 && global.cinemaTimer = 40
{
	global.etat.musique = mOcheon
	oJoueur.sprite_index = sOnderHaut
	global.etat.p22_cinema1 = 3
	DialogDef(6, sOcheonTete, oOcheon)
	Dialog("Oh !       \nBonjour, seriez-vous intéressé par \ncette poussière de la plus haute \nqualité ?!")
	DialogDef(6, sOcheonTeteHm, oOcheon)
	Dialog("...")
	DialogDef(6, sOcheonTeteGene, oOcheon)
	Dialog("Oh...")
	Dialog("C'est toi, méchant gars...")
}
if global.etat.p22_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	global.etat.p22_cinema1 = 4
	global.cinemaTimer = 0
}
if global.etat.p22_cinema1 = 4
{
	oOcheon.sprite_index = sOcheonBasParle
	if global.cinemaTimer < 20
	{
		oOcheon.x ++
		oOcheon.sprite_index = sOcheonDroite
	}
	else if global.cinemaTimer < 30
	{
		oOcheon.y ++
		oOcheon.sprite_index = sOcheonBas
		ocheon_devant = true
	}
	else if global.cinemaTimer < 48
	{
		oOcheon.x --
		oOcheon.sprite_index = sOcheonGauche
	}
	if global.cinemaTimer >= 60
	{
		global.etat.p22_cinema1 = 5
		DialogDef(6, sOcheonTeteGene, oOcheon)
		Dialog("Mais que fais-tu ici ?!     \nAurais-tu donc réussi à résoudre mon \nénigme ?!")
		DialogDef(6, sOcheonTete, oOcheon)
		Dialog("Impressionnant ! Très impressionnant !   \nRésoudre une énigme de si haut \nniveau...")
		DialogDef(6, sOcheonTeteNeutre, oOcheon)
		Dialog("Et puis, tu sais...              \nTu es la première personne qui résout \nréellement mes énigmes.")
		Dialog("D'habitude, quand je place des énigmes \nau milieu de la route, les gens se \ncontentent juste de les contourner en \npassant derrière les arbres.")
		DialogDef(6, sOcheonTete, oOcheon)
		Dialog("Mais toi, tu les fais toutes.")
		Dialog("Alors, pour te remercier, je vais te \nmontrer une petite dance que j'ai \napprise à mes heures perdues !")
		Dialog("La dance de la cravate !")
	}
}
if global.etat.p22_cinema1 = 5 && oMoniteurDialogue.actif = false
{
	global.etat.p22_cinema1 = 6
	global.cinemaTimer = 0
}
if global.etat.p22_cinema1 = 6
{
	oOcheon.sprite_index = sOcheonBasDance
	oOcheon.image_speed = 1
	if global.cinemaTimer > 440 {oOcheon.image_speed = 0.5}
	if global.cinemaTimer > 560 {oOcheon.sprite_index = sOcheonBasParle}
	if global.cinemaTimer = 680
	{
		oOcheon.sprite_index = sOcheonBasParle
		global.etat.p22_cinema1 = 7
		DialogDef(6, sOcheonTeteNeutre, oOcheon)
		Dialog("Mais...")
		Dialog("Qu'est-ce que je suis en train de faire, \nlà ?! Je ne dois pas me laisser aller \ncomme ça !")
		Dialog("Si tu continues à l'Est, \ntu arriveras très bientôt au village \nde la forêt, et puis juste après...     \nTu atteindras le château !")
		DialogDef(6, sOcheonTeteEnerve, oOcheon)
		Dialog("Et je ne peux pas laisser ça se produire !")
		Dialog("Alors prépare-toi, méchant gars...")
		Dialog("Car moi, Ocheon, je vais t'arrêter \npour de bon !")
	}
}
if global.etat.p22_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	Music_stop(1500)
	global.etat.p22_cinema1 = 8
	GotoRoomDuration(Fin_demo, -100, -100, 90)
}