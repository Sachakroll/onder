init = 0
timer = 180

puzzle = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,0]]

phase = ""
ordinal = 0

defaite_detectee = false


function bloque_a_droite(tx, ty)
{
	for (var _tx = tx + 1; _tx <= 12; _tx++)
	{
		if puzzle[ty][_tx] = 1
		{
			return true;
		}
	}
	
	return false;
}

function detecter_defaite()
{
	defaite_detectee = puzzle_impossible()
}

function puzzle_impossible()
{
	for (var ty = 0; ty < 4; ty++)
	{
		for (var tx = 0; tx < 12; tx++)
		{
			// Case vide dont la case droite est occupée
			// On va chercher un chemin pour aller à droite via un autre y
			if puzzle[ty][tx] = 0 && puzzle[ty][tx+1] = 1
			{
				issue_trouvee = false
				
				// Vers le haut
				ny = ty - 1
				while (ny >= 0 && puzzle[ny][tx] = 0)
				{
					if !bloque_a_droite(tx, ny)
					{
						issue_trouvee = true
					}
					ny--
				}
				
				// Vers le bas
				ny = ty + 1
				while (ny <= 3 && puzzle[ny][tx] = 0)
				{
					if !bloque_a_droite(tx, ny)
					{
						issue_trouvee = true
					}
					ny++
				}
				
				if issue_trouvee = false
				{
					return true
				}
			}
		}
	}
	
	return false;
}