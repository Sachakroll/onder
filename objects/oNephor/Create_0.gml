dir = 0
pix = 0
mov = 0
timer = 0
cin = 0
function move(_direction, _pixels)
{
	dir = _direction
	pix = _pixels
	mov = 1
	timer = 0
	plat = 0
	image_speed = 3
}
function movePlat(_direction, _pixels)
{
	dir = _direction
	pix = _pixels
	mov = 1
	timer = 0
	plat = 1
	image_speed = 3
}