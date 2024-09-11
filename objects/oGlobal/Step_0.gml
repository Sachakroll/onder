global.etat.playtime += 1/60

if global.etat.pv > global.pvMax
{
	global.etat.pv = global.pvMax
}
if global.etat.pv < 0
{
	global.etat.pv = 0
}

// Gestion des musiques

if global.etat.musique = -1 && musiqueAncien != -1
{
	audio_stop_sound(musiqueAncien)
}
if musiqueAncien = -1 && global.etat.musique != -1
{
	audio_play_sound(global.etat.musique, 100, 999999999)
	audio_sound_gain(global.etat.musique, global.volume, 0)
}
if musiqueAncien != -1 && global.etat.musique != -1 && global.etat.musique != musiqueAncien
{
	audio_stop_sound(musiqueAncien)
	audio_play_sound(global.etat.musique, 100, 999999999)
	audio_sound_gain(global.etat.musique, global.volume, 0)
}

musiqueAncien = global.etat.musique

if music_set_timer != -1
{
	if music_set_timer = music_set_maxtimer
	{
		music_set_timer = -1
		global.etat.musique = waiting_music
		music_set_maxtimer = -2
	}
	music_set_timer++
}

show_debug_message(global.etat.musique)