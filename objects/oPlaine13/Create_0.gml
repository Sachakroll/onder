init = 0

choix = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

if global.etat.p13_cinema1 = 0
{
	oOcheon.sprite_index = sOcheonTronc
	oOcheon.image_index = 0
	oOcheon.x = 208
	oOcheon.y = 369
	oOcheonCastor.visible = true
}

if global.etat.p13_cinema1 = 12
{
	oOcheon.x = 500
	oOcheon.y = 250
	oOcheonCastor.visible = false
}