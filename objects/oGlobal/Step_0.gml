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
	global.nephor_music_change = 0
	audio_stop_sound(musiqueAncien)
}
if musiqueAncien = -1 && global.etat.musique != -1
{
	global.nephor_music_change = 0
	audio_play_sound(global.etat.musique, 100, true)
	audio_sound_gain(global.etat.musique, global.volume, 0)
}
if musiqueAncien != -1 && global.etat.musique != -1 && global.etat.musique != musiqueAncien
{
	audio_stop_sound(musiqueAncien)
	
	global.nephor_music_change = 0
	if global.etat.musique = mNephor_int || global.etat.musique = mNephor_ext
	{audio_play_sound(global.etat.musique, 100, true, 1, global.nephor_music_time/60)}
	else {audio_play_sound(global.etat.musique, 100, true)}
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

// Musique de Nephor

if global.etat.musique = mNephor_ext || global.etat.musique = mNephor_int {global.nephor_music_time ++}
if global.nephor_music_time = 5123 {global.nephor_music_time = 0}

if global.nephor_music_change = 1 {global.etat.musique = mNephor_int}
if global.nephor_music_change = 2 {global.etat.musique = mNephor_ext}