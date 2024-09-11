pct = global.etat.pv / global.pvMax
draw_set_colour(c_white)
draw_rectangle(oBarreVieCombat.x, oBarreVieCombat.y, 
	oBarreVieCombat.x + (sprite_get_width(sBarreVieCombat)*pct),
	oBarreVieCombat.y + sprite_get_height(sBarreVieCombat) - 1, false)

draw_set_font(Font)
if global.etat.pv >= 10
{
	draw_text(oBarreVieCombat.x - 70, oBarreVieCombat.y, string(global.etat.pv) + "/" + string(global.pvMax))
}else
{
	draw_text(oBarreVieCombat.x - 60, oBarreVieCombat.y, string(global.etat.pv) + "/" + string(global.pvMax))
}

