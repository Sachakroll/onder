targetRoom = Plaine1
targetX = 0
targetY = 0

duration = 20
color = c_black

timer = 0
alpha = 0
state = 0

durationInCinema = 20

function startFade(_targetRoom, _targetX, _targetY, _duration) {
	targetRoom = _targetRoom
	targetX = _targetX
	targetY = _targetY
	duration = _duration
	timer = 1
	state = 0
	cinIn = 0
	global.cinema = true
}

function fadeInCinema(_duration) {
	durationInCinema = _duration
	timer = 1
	state = 0
	cinIn = 1
}