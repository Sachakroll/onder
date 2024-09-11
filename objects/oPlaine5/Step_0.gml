if oJoueur.collision(oDeclencheur1) && global.etat.p5_cinema1 = 0
{
	global.etat.p5_cinema1 = 1
	global.cinema = true
	global.cinemaTimer = 0
	oJoueur.sprite_index = sOnderDroite
}

if global.cinema = true && global.etat.p5_cinema1 = 1
{
	global.cinemaTimer ++
}

if global.cinema = true && global.etat.p5_cinema1 = 1 && global.cinemaTimer > 20
{
	oCamera.x ++
}

if global.cinema = true && global.etat.p5_cinema1 = 1 && global.cinemaTimer = 84
{
	oNephor.sprite_index = sNephorBasEtonne
	global.etat.p5_cinema1 = 2
	DialogDef(6, sNephorTeteOh, oNephor)
	Dialog("Oh !")
	global.cinemaTimer = 0
	global.etat.p5_cinema1 = 3
	global.etat.musique = mForet
}

if global.cinema = true && global.etat.p5_cinema1 = 3
{
	global.cinemaTimer ++
}

if global.cinema = true && global.etat.p5_cinema1 = 3 && global.cinemaTimer = 30
{
	oNephor.sprite_index = sNephorBasNeutreParle
}

if global.cinema = true && global.etat.p5_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	oNephor.sprite_index = sNephorGaucheParle
	global.etat.p5_cinema1 = 4
	global.cinemaTimer = 0
}

if global.cinema = true && global.etat.p5_cinema1 = 4
{
	global.cinemaTimer ++
}

if global.cinema = true && global.etat.p5_cinema1 = 4 && global.cinemaTimer = 60
{
	global.etat.p5_cinema1 = 5
	DialogDef(6, sNephorTeteJoyeux, oNephor)
	Dialog("Excuse-moi, c'est qu'on ne voit pas\nsouvent de visiteurs par ici...")
	Dialog("Et je ne pense pas avoir déjà vu ta tête. \nQu'est-ce que tu viens faire là ?")
	Dialog("Tu viens me rendre visite à moi,  \nNephor ?")
}

if global.cinema = true && global.etat.p5_cinema1 = 5 && oMoniteurDialogue.actif = false
{
	global.etat.p5_cinema1 = 6
	oNephor.sprite_index = sNephorGaucheNeutreParle
	DialogDef(3, sNephorTeteHm, oNephor)
	Dialog("...")
}

if global.cinema = true && global.etat.p5_cinema1 = 6 && oMoniteurDialogue.actif = false
{
	global.etat.p5_cinema1 = 7
	oNephor.sprite_index = sNephorGaucheParle
	DialogDef(6, sNephorTeteJoyeux, oNephor)
	Dialog("Oh, tu peux entrer si tu veux,   \nj'ai justement presque fini de\npréparer le repas. ")
	Dialog("Je fais toujours de trop grandes\nquantités donc il y en aura sûrement\nassez pour toi aussi. ")
}

if global.cinema = true && global.etat.p5_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	global.etat.p5_cinema1 = 8
	global.cinemaTimer = 0
}

if global.cinema = true && global.etat.p5_cinema1 = 8
{
	global.cinemaTimer ++
}

if global.cinema = true && global.etat.p5_cinema1 = 8 && global.cinemaTimer < 54
{
	oNephor.move("droite", 54)
}

if global.cinema = true && global.etat.p5_cinema1 = 8 && global.cinemaTimer > 52
{
	oNephor.move("haut", 17)
}

if global.cinema = true && global.etat.p5_cinema1 = 8 && global.cinemaTimer = 69
{
	global.etat.p5_cinema1 = 9
	global.cinemaTimer = 0
	instance_destroy(oNephor)
}

if global.cinema = true && global.etat.p5_cinema1 = 9
{
	global.cinemaTimer ++
}

if global.cinema = true && global.etat.p5_cinema1 = 9 && global.cinemaTimer > 40
{
	oCamera.x = oCamera.x - 1
}

if global.cinema = true && global.etat.p5_cinema1 = 9 && global.cinemaTimer = 120
{
	global.cinemaTimer = 0
	global.etat.p5_cinema1 = 10
	global.cinema = 0
}