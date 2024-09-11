init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

choix_etape = 0

if global.etat.p18_dialogOcheon = 0
{
	oOcheonHamac.visible = true
}
if global.etat.p18_dialogOcheon = 3
{
	oOcheonHamac.visible = false
}