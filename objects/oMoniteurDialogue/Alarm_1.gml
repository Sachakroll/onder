/// @description Mouvement de la bouche
if (actif == true && defilementEnCours == true)
{
	
	//global.camX = global.camX - 1
	//camera_set_view_pos(global.cam, global.camX, global.camY)
	
	
	bouche = 1 - bouche
	alarm[1] = vitesseBouche
}
else
{
	bouche = 0
}