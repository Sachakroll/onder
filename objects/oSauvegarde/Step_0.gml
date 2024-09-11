if Interaction(oSauvegarde)
{
	DialogDef(6, 0, 0)
	Dialog("Ceci est un point de sauvegarde.")
	Dialog("Cependant, il ne fonctionne pas encore \nparfaitement. Soyez indulgent, c'est une démo.")
	Dialog("Il permet de sauvegarder votre partie de sorte \nque quand vous mourrez, vous réapparaîtrez là \noù vous avez sauvegardé pour la dernière fois.")
	Dialog("Mais si vous quittez le jeu, votre partie sera perdue.")
	Dialog("PV complètement restaurés.")
	Dialog("Partie sauvegardée.")
	global.etat.pv = global.pvMax
	Save()
}

if oJoueur.y < y
{
	depth = oJoueur.depth - 20
}
if oJoueur.y >= y
{
	depth = oJoueur.depth + 20
}