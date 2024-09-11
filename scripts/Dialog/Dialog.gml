function Dialog(texte) {
	global.can_speak = false
	oMoniteurDialogue.afficher(texte)
}

function DialogDef(vitesse, sprite, personnage) {
	oMoniteurDialogue.definir(vitesse, sprite, personnage)
}

function Choix(listeChoix) {
	return oMoniteurDialogue.afficherChoix(listeChoix)
}

function GetChoix() {
		choix = oMoniteurDialogue.choix
		return choix
}