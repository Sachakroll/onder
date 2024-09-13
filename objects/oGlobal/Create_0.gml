//Initialisation de l'état du jeu

global.debugmode = 1
global.skipDialog = 0
global.debugmode_vision = 0

global.etatPersistant = {}

global.etatPersistant.combat1atteint = false
global.etatPersistant.temps = 0

global.etat = {}
global.etatSave = {}

global.etat.musique = -1
musiqueAncien = -1
global.volume = 0

global.etat.playtime = -1

global.etat.inventaire = ["", "", "", ""]
global.pvMax = 10
global.etat.pv = global.pvMax
global.etat.pieces = 0
global.etat.saveRoom = Plaine7
global.etat.saveX = 0
global.etat.saveY = 0

global.etat.p5_cinema1 = 0
global.etat.p6_cinema1 = 0
global.etat.p7_pommePrise = 0
global.etat.p7_panneauOiseauxLu = 0
global.etat.p7_phaseBarque = 0
global.etat.p7_coneParle = 0
global.etat.p8_cinema1 = 0
global.etat.p9_degatsBarque = 0
global.etat.p12_pommePrise = 0
global.etat.p11_cinema1 = 0
global.etat.p13_cinema1 = 0
global.etat.p13_objPris = 0
global.etat.p14_cinema1 = 0
global.etat.p15_cinema1 = 0
global.etat.p16_cinema1 = 0
global.etat.p16_edwarInteraction = 0
global.etat.p17_cinema1 = 0
global.etat.p18_dragobertParlE = 0
global.etat.p18_hamacTrouE = 0
global.etat.p18_lastHamac = 0
global.etat.p18_dialogOcheon = 0
global.etat.p19_cinema1 = 0
global.etat.p19_hibouDonnEOffrePetitHamac = 0
global.etat.p20_ocheonParle = 0
global.etat.p20_labyrintheReussi = 0
global.etat.ocheonCombatCommencE = 0
global.etat.levierOcheonActif = 0

function Music_stop(temps)
{
	audio_sound_gain(global.etat.musique, 0, temps)
}

music_set_timer = -1
music_set_maxtimer = 0
waiting_music = -1

function Music_set(musique, temps)
{
	music_set_timer = 0
	music_set_maxtimer = temps
	waiting_music = musique
}

function AddInv(obj) {
	i = 0
	emplacement = -1
	while (i < array_length(global.etat.inventaire) && emplacement == -1) {
		if global.etat.inventaire[i] == "" {
			emplacement = i
		}
		i++		
	}
	
	if emplacement >= 0 {
		global.etat.inventaire[emplacement] = obj
		return true
	}
	return false
}

function RemoveInv(emplacement) {
	global.etat.inventaire[emplacement] = ""
	i = emplacement + 1
	while (i < array_length(global.etat.inventaire)) {
		global.etat.inventaire[i - 1] = global.etat.inventaire[i]
		global.etat.inventaire[i] = ""
		i++
	}
}

function GetInvSize() {
	size = 0
	i = 0
	while (i < array_length(global.etat.inventaire)) {
		if global.etat.inventaire[i] != "" {
			size++
		}
		i++
	}
	return size
}

function struct_copy(source)
{
    var properties = variable_struct_get_names(source);
    
    var target = {};
    for (var i = 0; i < array_length(properties); i++)
    {
		var prop = source[$properties[i]];
		
		if (is_array(prop)) {
			new_array = []
			array_copy(new_array, 0, prop, 0, array_length(prop));
			prop = new_array
		}
		
		if (is_struct(prop)) {
			new_struct = struct_copy(prop)
			prop = new_struct
		}
		
		target[$properties[i]] = prop;
    }
    
    return target;
}

function sauvegarder()
{
	global.etat.saveRoom = room
	global.etat.saveX = oJoueur.x
	global.etat.saveY = oJoueur.y
	global.etatSave = struct_copy(global.etat)
}

function charger()
{
	global.etat = struct_copy(global.etatSave)
	GotoRoomDuration(global.etat.saveRoom, global.etat.saveX, global.etat.saveY, 100)
}

function Utiliser(choix, emplacement) {
	objet = global.etat.inventaire[emplacement - 1]
	
	if objet = "Pomme"
	{
		if choix = 1
		{
			DialogDef(6, 0, 0)
			Dialog("Vous mangez la pomme. \nVous récupérez 6 PV.")
			global.etat.pv += 6
			RemoveInv(emplacement - 1)
		}
		if choix = 2
		{
			DialogDef(6, 0, 0)
			Dialog("C'est une pomme. Elle rend 6 PV.")
		}
		if choix = 3
		{
			DialogDef(6, 0, 0)
			Dialog("Vous jetez la pomme au sol.")
			Dialog("Il n'en reste plus que de la compote.")
			Dialog("Vous obtenez la compote de pomme.")
			RemoveInv(emplacement - 1)
			AddInv("Compote")
		}
	}
	
	if objet = "Compote"
	{
		if choix = 1
		{
			DialogDef(6, 0, 0)
			Dialog("Vous ne savez pas si vous venez de manger ou \nde boire la compote. \nVous récupérez 5 PV.")
			global.etat.pv += 5
			RemoveInv(emplacement - 1)
		}
		if choix = 2
		{
			DialogDef(6, 0, 0)
			Dialog("C'est une compote de pomme. Elle rend 5 PV.")
		}
		if choix = 3
		{
			DialogDef(6, 0, 0)
			Dialog("Vous vous débarassez de la compote.")
			RemoveInv(emplacement - 1)
		}
	}
	
	if objet = "Bout déguisement"
	{
		if choix = 1
		{
			DialogDef(6, 0, 0)
			Dialog("Vous mangez le bout de déguisement...   \nCe n'est pas très bon.  \nVous récupérez 0 PV.")
			RemoveInv(emplacement - 1)
		}
		if choix = 2
		{
			DialogDef(6, 0, 0)
			Dialog("C'est un morceau de carton provenant du \ndéguisement d'Ocheon. \nÇa n'a pas l'air comestible.")
		}
		if choix = 3
		{
			DialogDef(6, 0, 0)
			Dialog("Vous jetez le bout de déguisement.")
			RemoveInv(emplacement - 1)
		}
	}
}