var _alpha = 0
if etape = 4 {_alpha = (global.cinemaTimer-120)/240}
if etape = 5 {_alpha = 1}
draw_sprite_ext(sFade_white, 0, 0, 0, 1, 1, 0, c_white, _alpha)