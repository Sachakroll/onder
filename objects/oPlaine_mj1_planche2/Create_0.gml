moving = true
cx = 13
cy = -1
old_cx = 13
ejection = 0

limite_timer = floor(random(8.999)) + 6
timer = 0

tremblement_x = random(1.999) - 1
tremblement_y = random(1.999) - 1

x_base = 0
y_base = 0

function trembler(intensite)
{
	timer ++
	if timer = limite_timer
	{
		timer = 0
	}
	if timer < (limite_timer / 2)
	{
		x = x_base + (timer / (limite_timer / 2) * tremblement_x * intensite)
		y = y_base + (timer / (limite_timer / 2) * tremblement_y * intensite)
	}
	if timer > (limite_timer / 2)
	{
		x = x_base + intensite - (timer / (limite_timer / 2) * tremblement_x * intensite)
		y = y_base + intensite - (timer / (limite_timer / 2) * tremblement_y * intensite)
	}
}