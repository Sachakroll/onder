init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

oOcheon.visible = false

if global.etat.p15_cinema1 = 0
{
	oOcheonCoffre.sprite_index = sOcheonCoffre_ferme
}
if global.etat.p15_cinema1 = 6
{
	oOcheonCoffre.sprite_index = sOcheonCoffre_ouvert
}