if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && global.can_speak && oMoniteurDialogue.actif == false && oJoueur.collision(oDeclencheurZone)
{
	DialogDef(6, 0, 0)
	Dialog("Vous pouvez bien descendre cette chute d'eau.\nCelles que vous avez déjà descendues étaient\nbien plus hautes.")
}

if global.p2_cinema1 > 0
{
	if global.p2_cinema1 <= 20
	{
		oJoueur.x = oJoueur.x + 0.5
	}
	oJoueur.y = oJoueur.y + 2
	global.p2_cinema1++
	
	if global.p2_cinema1 = 60
	{
		global.p2_cinema1 = 0
	}
}