global.cinemaTimer++

if oJoueur.collision(oDeclencheur1) && global.etat.p17_cinema1 = 0
{
	global.etat.p17_cinema1 = 1
	global.cinema = true
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 1
{
	if global.cinemaTimer < 25
	{
		oCamera.x++
	}
	if global.cinemaTimer = 16
	{
		oJoueur.sprite_index = sOnderHaut
	}
	if global.cinemaTimer = 70
	{
		global.etat.p17_cinema1 = 2
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_parle
		DialogDef(6, 0, oGuideTouristique_foret)
		Dialog("Salut !   \nC'est moi, le guide touristique de la forêt !")
		Dialog("Et oui ! J'aurais dû être le guide touristique du \nchâteau mais la place était malheureusement déjà \nprise...")
		Dialog("Mais ce n'est pas grave ! J'ai tout de même la \ndeuxième région la plus intéressante des cinq \ngrandes régions !")
		Dialog("Et en tant que meilleur guide touristique des deux, \nje me suis beaucoup renseigné sur la forêt. \nJe la connais par coeur !!")
		Dialog("Hmm...")
		Dialog("Tu n'as pas l'air d'ici, ce qui implique que je vais \nêtre obligé de te faire le plaisir de te la présenter \nen détail !")
		Dialog("Alors...    \nPar où commencer ?")
		
		Dialog("Ah oui ! La forêt est une des cinq régions \nadministratives du royaume, avec le château, la \nmontagne, le désert et le marais.")
		Dialog("Elle compte 34 habitants, dont moi, et est donc la \ntroisième région la plus peuplée du royaume ! \nC'est aussi la seconde plus grande en superficie, \naprès le désert !")
		Dialog("Maintenant, pour ce qui est de la géographie \nphysique... La forêt contient une cascade, tout à \nl'ouest, qui étrangement ne s'écoule dans aucune \nrivière.")
		Dialog("L'eau forme juste une flaque par terre qui ne \ndéborde jamais. C'est que le sol doit avoir très soif \nlà-bas, pour boire toute cette eau !")
		Dialog("Ou alors elle s'évapore très vite, ou quelqu'un \nvient la boire tous les jours sans qu'on s'en \naperçoive ?")
		Dialog("Ça voudrait dire qu'il a très soif, vu la quantité \nd'eau qui coule de là-haut...")
		Dialog("Mais... ma théorie personnelle, c'est que l'eau \ns'écoule de haut en bas derrière la cascade, \ncomme ça elle remonte et elle redescend à l'infini, \nsans qu'on le voie !")
		Dialog("Mais bon... on sait pas vraiment. Nos scientifiques \ntravaillent encore à l'explication de ce phénomène !")
		Dialog("Quoi qu'il en soit, après ça, il y a une petite clairière \nverte assez longue mais très étroite où on peut \ntrouver 38 fleurs en tout.")
		Dialog("Quoi ? Comment je sais ça ? Eh bien, j'ai participé à \nun concours de comptage de fleurs il y a deux ans, \net c'est à cet endroit-là que j'ai dû compter les \nfleurs.")
		Dialog("J'ai gagné, bien entendu ! Et j'en avais compté 34 !")
		Dialog("Et en appliquant la formule de croissance annuelle \ndes fleurs que l'on apprend à l'école, on trouve que \nmaintenant il y en a 38 !")
		Dialog("Hé ! \nTu peux aller les compter si tu ne me crois pas !")
		Dialog("Ensuite, dans cette clairière, il y a la maison de \nNephor, ce bon vieux fermier ! C'est lui qui nourrit \nà lui seul la moitié des habitants de la forêt ! Et oui !")
		Dialog("Le reste de la nourriture vient de l'usine de pâtes \nau château. C'est une usine où ils fabriquent les \npâtes à partir de bois !")
		Dialog("C'est un procédé très complexe, ils utilisent un \nmélange de 14,36% d'écorce, 85,61% de bois et \n0,02% d'air !")
		Dialog("Euh, attends, je suis en train de parler du château, \nlà !")
		Dialog("Pfff... Ça devrait vraiment être moi le guide \ntouristique du château ! En plus ici il n'y a presque \npersonne qui vient visiter la forêt...")
		Dialog("Tu es le premier touriste ici depuis l'année dernière. \nAlors quoi ? Moi je dois juste attendre ici comme \nça ?")
		Dialog("Pff...")
		Dialog("Bon, quoi qu'il en soit, tu vois le bois qu'on utilise \npour faire les pâtes. Eh ben il vient de la forêt ! \nIl vient d'ici !")
		Dialog("Et oui, c'est 14,36% écorce, 85,61% bois, 0,02% air, \net 100% local !")
		Dialog("Et donc c'est le bûcheron qui coupe le bois. \nOui, le bûcheron, il n'y en a qu'un. Et vu que tout le \nmonde l'appelle 'le bûcheron', on a tous oublié son \nnom.")
		Dialog("Donc maintenant c'est comme ça qu'il s'appelle. \n'Le bûcheron'.")
		Dialog("Tout ça pour te dire que dans cette forêt, c'est le \nfermier et le bûcheron qui nourrissent toute la \npopulation ! Hahaha !")
		Dialog("Bon, sinon, ce que j'ai oublié de préciser, c'est qu'il \ny a la rivière qui passe au milieu de la clairière, \ndonc il y a un pont à cet endroit-là.")
		Dialog("Voilà, comme ça tu sais...")
		Dialog("Ensuite, il y a de nouveau la rivière qui passe, et là \nil n'y a pas de pont. Normalement il y a un petit \nsentier dans la forêt pour contourner la rivière.")
		Dialog("Mais en général les touristes ne le remarquent pas \net ils traversent juste à la nage. Alors pour les aider \non a mis une barque.")
		Dialog("Le problème c'est que ça ne permet que de \ntraverser dans un sens. Alors de l'autre côté, on a \ninstallé une cabane à oiseaux.")
		Dialog("Comme ça si quelqu'un veut traverser d'est en \nouest il lui suffit de demander aux oiseaux de le \nporter jusqu'à l'autre bout.")
		
		Dialog("Et ensuite... euh...           \nAh oui, c'est vrai. C'est ici que se termine la \nprésentation gratuite de la région ! Pour connaître \nla suite, il faudra payer !")
		Dialog("Cela coûte 50 pièces !       \nAlors, tu as 50 pièces ?")
		Dialog("Non ? Eh bien, pas de chance !")
		Dialog("...")
		Dialog("Hmmm...")
		Dialog("Bon, d'accord, je vois bien que tu meurs d'envie \nd'en apprendre davantage. Alors...          \nJe vais te le faire gratuitement !")
		Dialog("Alors, ça te va ? Je t'explique la suite ?")
		
		Choix(["Non !", "SURTOUT PAS !", "oui"])
	}
}

if global.etat.p17_cinema1 = 2 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 3
	if GetChoix() = 1
	{
		Dialog("Pardon ? Je ne t'ai pas bien entendu. \nTu as dit : «oui», c'est ça ?")
	}
	if GetChoix() = 2
	{
		Dialog("Pardon ? Je ne t'ai pas bien entendu. \nTu as dit : «absolument», c'est ça ?")
	}
	Dialog("Parfait !")
	Dialog("Je vais donc continuer mes explications.     \nAlors... Où en étais-je ?")
}

if global.etat.p17_cinema1 = 3 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 4
	oOcheonLettre.x = 374
	oOcheonLettre.y = 233
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 4
{
	oOcheonLettre.x --
	oOcheonLettre.image_angle += 6
	if global.cinemaTimer = 100
	{
		global.etat.p17_cinema1 = 5
		global.cinemaTimer = 0
		oOcheonLettre.x = 0
		oOcheonLettre.y = 0
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_lettre1
	}
}

if global.etat.p17_cinema1 = 5 && global.cinemaTimer = 40
{
	global.etat.p17_cinema1 = 5.5
	Dialog("Oh ! Une lettre ! Je vais l'ouvrir dès maintenant, \npeut-être que c'est important.")
}

if global.etat.p17_cinema1 = 5.5 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 6
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 6
{
	if global.cinemaTimer = 20
	{
		oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_lettre2
	}
	if global.cinemaTimer = 60
	{
		global.etat.p17_cinema1 = 7
		Dialog("Il est écrit : \n«Attention ! Vous devez vous rendre au village \nd'urgence en raison d'une vente de poussière de \ntrès haute qualité !»")
		Dialog("«Ne traînez pas, il n'y en aura pas pour tout le \nmonde !»")
		Dialog("Tiens donc ! Une vente de poussière ? \nQu'est-ce que c'est que ça encore ?")
		Dialog("...")
		Dialog("Il faut que j'aille voir ça.")
	}
}

if global.etat.p17_cinema1 = 7 && oMoniteurDialogue.actif = false
{
	global.etat.p17_cinema1 = 8
	global.cinemaTimer = 0
}

if global.etat.p17_cinema1 = 8
{
	oGuideTouristique_foret.sprite_index = sGuideTouristique_foret_bouge
	oGuideTouristique_foret.x += 0.5
	if global.cinemaTimer = 320
	{
		Music_change(mOcheon, 1500, 136)
		oGuideTouristique_foret.x = 0
		oGuideTouristique_foret.y = 0
		global.etat.p17_cinema1 = 9
		global.cinemaTimer = 0
	}
}

if global.etat.p17_cinema1 = 9
{
	oOcheon.sprite_index = sOcheonGuideGauche
	oOcheon.x--
	if global.cinemaTimer = 110
	{
		oOcheon.sprite_index = sOcheonGuideBasParle
		global.etat.p17_cinema1 = 10
		global.cinemaTimer = 0
	}
}

if global.etat.p17_cinema1 = 10 && global.cinemaTimer = 60
{
	global.etat.p17_cinema1 = 11
	DialogDef(6, sOcheonTete, oOcheon)
	Dialog("Hé hé ! Salut ! \nC'est encore moi, le guide touristique !")
	Dialog("Il y a quelque chose que j'avais oublié \nde te dire...")
	Dialog("...")
	Dialog("En fait le chemin à l'est est bloqué, \ndonc à la place il faudra prendre \nun détour qui se trouve très très loin \nà l'ouest.")
	Dialog("Alors je te conseille de partir à l'ouest \ndès maintenant !")
	Dialog("Voilà.    \nSalut !")
}

if global.etat.p17_cinema1 = 11 && oMoniteurDialogue.actif = false
{
	Music_change(mForet, 1500, 136)
	global.etat.p17_cinema1 = 12
	global.cinemaTimer = 0
	oOcheon.sprite_index = sOcheonGuideDroite
}

if global.etat.p17_cinema1 = 12
{
	oOcheon.x++
	if global.cinemaTimer > 90
	{
		oCamera.x--
	}
	if global.cinemaTimer = 120
	{
		global.cinema = false
		global.etat.p17_cinema1 = 13
		oOcheon.visible = false
		oGuideTouristique_foret.visible = false
	}
}

if Interaction(oGuideTouristique_foret_stand) && global.etat.p17_cinema1 = 13
{
	DialogDef(6,0,0)
	Dialog("Le stand du guide touristique.")
	Dialog("Il est en carton.")
}