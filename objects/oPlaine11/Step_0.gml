global.cinemaTimer++

if oJoueur.collision(oDeclencheur2) && global.etat.p11_cinema1 = 0
{
	global.cinema = true
	global.cinemaTimer = 0
	global.etat.p11_cinema1 = 1
	Music_stop(3000)
}

if global.etat.p11_cinema1 = 1
{
	oCamera.y--
	if global.cinemaTimer = 80
	{
		global.etat.p11_cinema1 = 2
		global.cinemaTimer = 0
	}
}

if global.etat.p11_cinema1 = 2 && global.cinemaTimer = 60
{
	global.etat.p11_cinema1 = 3
	DialogDef(6, 0, oOcheon)
	Dialog("Hmmm...")
	Dialog("Je me suis trouvé un nouveau métier récemment...")
	Dialog("J'ai commencé à vendre de la poussière au \nmarché. Ça marche très bien, j'ai déjà deux \nclients !")
	Dialog("Moi, Ocheon, tiens à offrir de la poussière de \nqualité, c'est pourquoi je la récolte dans ma \nmaison grâce à mon fidèle aspirateur.")
	Dialog("Mais, il y a quelques jours, je me suis dit que je \npourrais peut-être trouver de la meilleure \npoussière dans le désert, plus loin vers l'est.")
	Dialog("Je me suis alors rendu au désert. \nMalheureusement, je n'y ai trouvé que du sable...")
	Dialog("Pas de poussière !")
	Dialog("J'ai alors décidé de rentrer chez moi quand  \nsoudain...")
	Dialog("Trois méchants gars m'ont sauté dessus et m'ont \nrecouvert la tête d'un sac en papier...")
	Dialog("Évidemment, j'ai saisi l'occasion et je leur ai tout \nde suite proposé de la poussière à un prix réduit !")
	Dialog("Je ne comprends toujours pas pourquoi ils ont \nrefusé...")
	Dialog("...")
	Dialog("En tout cas, ce qu'il s'est passé ensuite, \nc'est qu'ils m'ont attaché contre un rocher au \nmilieu du désert. Ce n'est pas très sympathique \nétant donné qu'il faisait très chaud...")
	Dialog("Mais heureusement, je n'ai dû patienter que \nquelques instants avant qu'un personnage \nressemblant à un petit diable vienne me libérer.")
	Dialog("Je lui ai alors immédiatement proposé de la \npoussière gratuite pour le remercier, mais ce \ngentil diable m'a dit que ça ne l'intéressait pas.         \nBizarre...")
	Dialog("À la place, il préférait que je lui rende un petit \nservice.")
	Dialog("Il m'a dit que bientôt, un méchant gars allait \ndébarquer dans la forêt, puis allait se rendre au \nchâteau !")
	Dialog("Il m'a dit que le méchant gars essayerait de \ndétruire le château et de renverser le roi.  \nBien sûr que je ne peux pas laisser ça se \nproduire !")
	Dialog("Ma mission est donc de l'arrêter ou, en tout cas \nde lui faire perdre du temps pour que le gentil \ndiable aie le temps de se préparer à son arrivée.")
	Dialog("Il m'a dit que le méchant gars allait venir de l'ouest. \nJe vais donc aller...")
	Dialog("À l'ouest !")
}

if global.etat.p11_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	global.etat.p11_cinema1 = 4
	global.cinemaTimer = 0
}

if global.etat.p11_cinema1 = 4
{
	if global.cinemaTimer = 60
	{
		oOcheon.sprite_index = sOcheonBasParle
	}
	if global.cinemaTimer = 100
	{
		oOcheon.sprite_index = sOcheonBasEtonne
	}
	if global.cinemaTimer = 120
	{
		global.etat.musique = mOcheon
		global.etat.p11_cinema1 = 5
		DialogDef(6, sOcheonTeteTresEtonne, oOcheon)
		Dialog("Oh !!!")
		DialogDef(6, sOcheonTeteOh, oOcheon)
		Dialog("Euh...")
		DialogDef(6, sOcheonTeteGene, oOcheon)
		Dialog("Oh non... C'est le méchant gars...")
		Dialog("Ça fait longtemps que tu es là... ?")
		Dialog("J'espère que tu n'as pas entendu tout \nce que j'ai dit... Ça serait très \nembarrassant...")
		DialogDef(6, sOcheonTete, oOcheon)
		Dialog("Soit ! Je m'appelle Ocheon et je suis là \npour t'arrêter !")
		DialogDef(6, sOcheonTeteDetermine, oOcheon)
		Dialog("Prépare toi à affronter mes plans les \nplus rusés !")
		Dialog("Tu n'as aucune idée du génie des\n machinations auxquelles tu auras à \nfaire !")
		DialogDef(6, sOcheonTete, oOcheon)
		Dialog("Alors !")
		DialogDef(6, sOcheonTeteHm, oOcheon)
		Dialog("Hmm...")
		Dialog("...")
		DialogDef(6, sOcheonTeteGene, oOcheon)
		Dialog("Je...")
		Dialog("En fait, je n'étais pas vraiment prêt à \nce que tu arrives maintenant, donc je \nne suis pas encore tout à fait au point...")
		DialogDef(6, sOcheonTeteDetermine, oOcheon)
		Dialog("Ne t'inquiète pas ! Je serai de retour \ntrès bientôt !")
		DialogDef(6, sOcheonTeteHm, oOcheon)
		Dialog("...")
		DialogDef(6, sOcheonTeteGene, oOcheon)
		Dialog("Salut !")
	}
}

if global.etat.p11_cinema1 = 5 && oMoniteurDialogue.actif = false
{
	global.etat.p11_cinema1 = 6
	global.cinemaTimer = 0
	oOcheon.image_speed = 1
	oOcheon.sprite_index = sOcheonHaut
}

if global.etat.p11_cinema1 = 6
{
	oOcheon.y -= 1.25
	if global.cinemaTimer = 32
	{
		global.etat.p11_cinema1 = 7
		global.cinemaTimer = 0
		oOcheon.sprite_index = sOcheonDroite
	}
}

if global.etat.p11_cinema1 = 7
{
	Music_change(mForet, 1500, 136)
	oOcheon.x += 1.25
	if global.cinemaTimer > 56
	{
		oCamera.y++
	}
	if global.cinemaTimer = 136
	{
		global.etat.p11_cinema1 = 8
		global.cinema = false
	}
}