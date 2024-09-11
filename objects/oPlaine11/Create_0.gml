init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

if global.etat.p11_cinema1 = 0
{
	oOcheon.sprite_index = sOcheonHautParle
	oOcheon.image_index = 0
	oOcheon.x = 138
	oOcheon.y = 274
}

if global.etat.p11_cinema1 = 8
{
	oOcheon.x = 400
	oOcheon.y = 250
}