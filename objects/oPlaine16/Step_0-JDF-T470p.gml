//Castor

if Interaction(oDeclencheurZone) && global.etat.p16_cinema1 = 0
{
	DialogDef(6,0,oOcheonCastor)
	Dialog("Salut ! C'est moi, le castor de tout à l'heure !")
	Dialog("Tu te souviens de moi ? J'avais mangé le \ndéguisement de l'autre ! On l'a bien eu !")
	Dialog("D'ailleurs, c'était fait en un type de bois assez \nbizarre. Le genre de bois avec lequel les gens \nfabriquent les boîtes où ils mettent les colis.")
	Dialog("Ça n'avait pas très bon goût en tout cas...")
	Dialog("...")
	Dialog("Mais... J'ai faim, quand même ! \nIl t'en resterait pas un bout ?")
	if global.etat.inventaire[0] = "Bout déguisement"
	|| global.etat.inventaire[1] = "Bout déguisement"
	|| global.etat.inventaire[2] = "Bout déguisement"
	|| global.etat.inventaire[3] = "Bout déguisement"
	{
		global.etat.p16_cinema1 = 1.1
		Dialog("Ah si ! Tu en as ! Tu m'en donnes ?")
		Choix(["Oui", "Non"])
	}else
	{
		global.etat.p16_cinema1 = 2.0
		Dialog("Ah non... Tu n'en as pas. Dommage !")
		Dialog("Raportes-en si tu en trouves !")
	}
}

if Interaction(oDeclencheurZone) && global.etat.p16_cinema1 = 2.0
{
	DialogDef(6,0,oOcheonCastor)
	Dialog("Alors, tu en as trouvé ?")
	if global.etat.inventaire[0] = "Bout déguisement"
	|| global.etat.inventaire[1] = "Bout déguisement"
	|| global.etat.inventaire[2] = "Bout déguisement"
	|| global.etat.inventaire[3] = "Bout déguisement"
	{
		global.etat.p16_cinema1 = 2.1
		Dialog("Oui !!! Tu m'en donnes ?!")
		Choix(["Oui", "Non"])
	}else
	{
		global.etat.p16_cinema1 = 2.0
		Dialog("Ah... Toujours pas. Dommage !")
		Dialog("Raportes-en si tu en trouves !")
	}
}

if (global.etat.p16_cinema1 = 1.1 || global.etat.p16_cinema1 = 2.1) && oMoniteurDialogue.actif = false
{
	global.etat.p16_cinema1 = 2.0
	if GetChoix() = 1
	{
		global.etat.p16_cinema1 = 3
		if global.etat.inventaire[0] = "Bout déguisement"
		{
			RemoveInv(0)
		}
		if global.etat.inventaire[1] = "Bout déguisement"
		{
			RemoveInv(1)
		}
		if global.etat.inventaire[2] = "Bout déguisement"
		{
			RemoveInv(2)
		}
		if global.etat.inventaire[3] = "Bout déguisement"
		{
			RemoveInv(3)
		}
		DialogDef(6,0,0)
		Dialog("Vous donnez le morceau de déguisement en \ncarton au castor.")
		DialogDef(6,0,oOcheonCastor)
		Dialog("Merci ! Tiens, pour te remercier !")
		global.etat.pieces += 8
		DialogDef(6,0,0)
		Dialog("Vous obtenez 8 pièces.")
	}
	if GetChoix() = 2
	{
		DialogDef(6,0,oOcheonCastor)
		Dialog("Rooohh !")
	}
}

if Interaction(oDeclencheurZone) && global.etat.p16_cinema1 = 3
{
	DialogDef(6,0,oOcheonCastor)
	Dialog("Merci pour le casse-croûte !")
}