init = 0

global.cam = view_camera[0];
global.camX = camera_get_view_x(global.cam);
global.camY = camera_get_view_y(global.cam);

choix = 1

timerAlternant10 = 0
timerAlternant4 = 0

if global.etat.p6_cinema1 > 22
{
	oCone.x = -100
	oCone.y = 1000
	oCone.visible = false
	oConeParle.x = -100
	oConeParle.y = 1000
	oConeParle.visible = false
}else
{
	oCone.x = 220
	oCone.y = 704
	oCone.visible = true
	oConeParle.x = 224
	oConeParle.y = 720
	oConeParle.visible = true
}

global.etat.musique = mForet

