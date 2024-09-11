if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && global.can_speak && oMoniteurDialogue.actif == false && oJoueur.collision(oDeclencheurZone)
	{
		DialogDef(6, 0, 0)
		Dialog("Vous n'êtes pas capable de remonter cette chute \nd'eau.")
		Dialog("Mais... même si vous le pouviez, pourquoi faire tout\nce chemin si c'est pour faire demi-tour au dernier\nmoment ?")
	}

/*if Interaction(oNephin) && global.p1_cinema1a = 0
{
	global.cinema = true
	global.p1_cinema1a = 1
	global.cinemaTimer = 0
}
if global.cinema = true && global.p1_cinema1a = 1
{
	global.cinemaTimer ++
	oNephin.x = oNephin.x + 0.2
}
if global.cinemaTimer = 120 && global.p1_cinema1a = 1
{
	DialogDef(6, 0, 0)
	Dialog("Ceci est une cinématique.")
	global.p1_cinema1a = 1.5
}
if global.cinema = true && global.p1_cinema1a = 1.5 && oMoniteurDialogue.actif = false
{
	global.p1_cinema1a = 2
	global.p1_cinema1b = 1
	global.cinemaTimer = 0
}
if global.cinema = true && global.p1_cinema1b = 1
{
	global.cinemaTimer ++
	oNephin.y = oNephin.y + 0.2
}
if global.cinemaTimer = 60 && global.p1_cinema1b = 1
{
	global.cinema = false
	global.p1_cinema1b = 2
}*/

/*
choix = GetChoix()

if (question == 1)
{
	if (choix == 1)
	{
		Dialog("Très bien")
	}
	if (choix == 2)
	{
		Dialog("Argh")
	}
	if (choix == 3)
	{
		Dialog("Voulez-vous vraiment détruire la \nplanète pour votre mégalomanie ?")
		Choix(["DA!!!", "J'hésite"])
		question = 2
	}
}


if (question == 2)
{
	if (choix == 1)
	{
		Dialog("Slava otyetchetsva")
	}
	if (choix == 2)
	{
		Dialog("Très bien, nous allons consulter vos généraux")
	}
}
*/