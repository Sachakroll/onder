global.cinemaTimer++

if Interaction(oDeclencheurZone)
{
	DialogDef(6,0,0)
	Dialog("Attention, méchant gars ! \nVoici le légendaire labyrinthe d'Ocheon !   \nPourras-tu le traverser ?")
}
if Interaction(oDeclencheurZone2)
{
	DialogDef(6,0,0)
	Dialog("Non, ce n'est pas par ici !")
}
if Interaction(oDeclencheurZone3)
{
	DialogDef(6,0,0)
	Dialog("Alors, on n'arrive pas à passer mon labyrinthe ?")
}
if Interaction(oDeclencheurZone4)
{
	DialogDef(6,0,0)
	Dialog("Non, pas par ici.  \nSi c'est vraiment trop difficile, tu n'as qu'à \nabandonner.")
}
if Interaction(oDeclencheurZone5)
{
	DialogDef(6,0,0)
	Dialog("Hé hé ! Ce livre à propos de la construction de \nlabyrinthes est vraiment très pratique !")
}
if Interaction(oDeclencheurZone6)
{
	global.etat.p20_labyrintheReussi = true
	DialogDef(6,0,0)
	Dialog("Quoi ?!! Tu as réussi à traverser mon labyrinthe ?!   \nTu es vraiment fort !")
}

if Interaction(oOcheonCollision) && global.etat.ocheonCombatCommencE = 0
{
	if global.etat.p20_ocheonParle = 3
	{
		DialogDef(6,sOcheonTeteGene,oOcheon)
		Dialog("...")
	}
	
	if global.etat.p20_ocheonParle = 2
	{
		DialogDef(6,sOcheonTeteGene,oOcheon)
		if global.etat.p20_labyrintheReussi = false
		{
			Dialog("Alors, tu l'as trouvée ?")
		}
		if global.etat.p20_labyrintheReussi = true
		{
			Dialog("Ah, tu l'as trouvée ! \nEuh... alors, ne t'inquiète pas ! \nJe te rejoindrai dans un instant !")
			global.etat.p20_ocheonParle = 3
		}
	}
	if global.etat.p20_ocheonParle = 1
	{
		DialogDef(6,sOcheonTeteGene,oOcheon)
		Dialog("Dis-moi si tu trouves la sortie.")
		global.etat.p20_ocheonParle = 2
		if global.etat.p20_labyrintheReussi = true
		{
			Dialog("Ah, tu l'as trouvée ! \nEuh... alors, ne t'inquiète pas ! \nJe te rejoindrai dans un instant !")
			global.etat.p20_ocheonParle = 3
		}
	}
	if global.etat.p20_ocheonParle = 0
	{
		DialogDef(6,sOcheonTeteGene,oOcheon)
		Dialog("Ah ! Tu es là...")
		Dialog("Le labyrinthe que j'ai construit est si \ndifficile que je m'y suis moi-même \nperdu.")
		global.etat.p20_ocheonParle = 1
	}
}