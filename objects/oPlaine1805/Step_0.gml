global.cinemaTimer++
if global.cinemaTimer = 240
{
	global.etat.p18_lastHamac = 1
	global.etat.p19_cinema1 = 6
	GotoRoomDuration(Plaine19, 105, 97, 140)
}
global.cinema = true