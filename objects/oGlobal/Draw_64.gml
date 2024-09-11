/// @description Debug mode

if global.debugmode_vision && global.debugmode
{
	debug_text = 
	"Temps joué : "+string(global.etat.playtime)
	+"\nMusique : "+audio_get_name(global.etat.musique)+" (Index : "+string_replace(string(global.etat.musique), "ref sound ", "")+")"
	+"\nVolume : "+string(global.volume)
	+"\nPièce : "+room_get_name(room)+" (Index : "+string_replace(string(room), "ref room ", "")+")"
	+"\nx : "+string(oJoueur.x)
	+"\ny : "+string(oJoueur.y)
	+"\nPV : "+string(global.etat.pv)
	+"\nPièces : "+string(global.etat.pieces)
	+"\nInv ("+string(GetInvSize())+"/4) :"
	+string_replace("\n[ "+string(array_get(global.etat.inventaire, 0))+" ]", "[  ]", "[ - - - ]")
	+string_replace("\n[ "+string(array_get(global.etat.inventaire, 1))+" ]", "[  ]", "[ - - - ]")
	+string_replace("\n[ "+string(array_get(global.etat.inventaire, 2))+" ]", "[  ]", "[ - - - ]")
	+string_replace("\n[ "+string(array_get(global.etat.inventaire, 3))+" ]", "[  ]", "[ - - - ]")
	
	draw_set_halign(fa_left);
	draw_set_font(Font);
	
	draw_set_color(make_color_rgb(0,0,255));
	draw_text(11,7,"Debug menu :")
	draw_text(7,41,debug_text)
	
	draw_text(13,9,"Debug menu :")
	draw_text(9,43,debug_text)
	
	draw_set_color(make_color_rgb(255,0,0));
	draw_text(12,8,"Debug menu :")
	draw_text(8,42,debug_text)
}