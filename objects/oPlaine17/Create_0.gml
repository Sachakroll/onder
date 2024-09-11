init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

if global.etat.p17_cinema1 = 0
{
	oOcheon.x = 380
	oOcheon.y = 247
}

if global.etat.p17_cinema1 = 13
{
	oGuideTouristique_foret.visible = false
	oOcheon.visible = false
}
