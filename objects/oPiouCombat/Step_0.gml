if sprite_index = sPiouCombat_pose
{
	if oPiounocchioCombat.sprite_index = sPiounocchioCombat1 || oPiounocchioCombat.sprite_index = sPiounocchioCombat5
	{
		if oPiounocchioCombat.image_index < 1
		{
			image_index = 0
		}
		if oPiounocchioCombat.image_index > 1
		{
			image_index = 1
		}
	}

	if oPiounocchioCombat.sprite_index = sPiounocchioCombatParle
	{
		if oPiounocchioCombat.image_index = 0
		{
			image_index = 1
		}
		if oPiounocchioCombat.image_index = 1
		{
			image_index = 0
		}
	}
}