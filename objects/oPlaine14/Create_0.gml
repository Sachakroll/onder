init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

timerAlternant = 0
timerAlternantEcroulement = 0

if global.etat.p14_cinema1 = 0
{
	oOurs.sprite_index = sOurs
	oOurs.x = 348
	oOurs.y = 282
	oPlaine_Riviere4.image_index = 0
}
if global.etat.p14_cinema1 = 23
{
	oOurs.y = 400
	oBucheron.visible = false
}

compteurDefaite = 0