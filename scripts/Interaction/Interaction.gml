function Interaction(obj){
	if oMasqueInteraction.collision(obj) && oJoueur.InteractionDirection(obj) && global.can_speak && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) && global.cinema == false && oMoniteurDialogue.actif == false
	{
		return true
	}else
	{
		return false
	}
}