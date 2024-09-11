function GotoRoom(targetRoom, targetX, targetY) {
	oFade.startFade(targetRoom, targetX, targetY, 20)
}

function GotoRoomDuration(targetRoom, targetX, targetY, duration) {
	oFade.startFade(targetRoom, targetX, targetY, duration)
}

function Fade(duration) {
	oFade.fadeInCinema(duration)
}

function Music_stop(temps_en_millisecondes) {
	oGlobal.Music_stop(temps_en_millisecondes)
}

function Music_set(musique, temps) {
	oGlobal.Music_set(musique, temps)
}

function Music_change(musique, duree_de_la_fin_en_millisecondes, temps_avant_le_recommencement_en_frames)
{
	Music_stop(duree_de_la_fin_en_millisecondes)
	Music_set(musique, temps_avant_le_recommencement_en_frames)
}