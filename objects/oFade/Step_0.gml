if (timer > 0) && cinIn == 0 {
	
	// State 0 : phase montante du "fade"
	if (state == 0) {
		timer++;
		
		if (timer >= duration) {
			room_goto(targetRoom)
		
			oJoueur.x = targetX
			oJoueur.y = targetY
			state = 1
			global.cinema = false
		}
	}
	
	// State 1 : phase descendante du "fade"
	if (state == 1) {
		timer--;
	}
	alpha = timer / duration
}



if (timer > 0) && cinIn == 1 {
	
	// State 0 : phase montante du "fade"
	if (state == 0) {
		timer++;
		
		if (timer >= durationInCinema) {
			state = 1
		}
	}
	// State 1 : phase descendante du "fade"
	if (state == 1) {
		timer--;
	}
	alpha = timer / durationInCinema
}