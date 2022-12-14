/// @description Insert description here
// You can write your code in this editor

frameNo++

if frameNo == 30 
{
	frameNo = 0
	for(y = 0; y < gridSize; y++)
	{
		for(x = 0; x < gridSize; x++)
		{
			backBuffer[@x, y] = 0
		}
	}

	for(y = 0; y < gridSize; y++)
	{
		for(x = 0; x < gridSize; x++)
		{
			var currentCell = frontBuffer[@x, y]
		
			// Count alive neighbours 
			neighbourCount = 0
			for(neighbourY = -1; neighbourY < 2; neighbourY++)
			{
				for(neighbourX = -1; neighbourX < 2; neighbourX++)
				{
					if 
					(neighbourX != 0 or neighbourY != 0) and
					neighbourX + x > -1 and neighbourX + x < gridSize and
					neighbourY + y > -1 and neighbourY + y < gridSize
					then 
					{
						var currentNeighbour = frontBuffer[@(neighbourX + x), (neighbourY + y)]
						if currentNeighbour == 1 then 
						{
							neighbourCount++
						}
					}
				}
			}
			
			if currentCell == 1 then
			{
				tiles[x, y].sprite_index = Alive

				backBuffer[@x, y] = 1
				//Dies of underpopulation or overpopulation
				if neighbourCount < 2 or neighbourCount > 3 then 
				{
					backBuffer[@x, y] = 0
				} 
			}
			else
			{
				tiles[x, y].sprite_index = Dead
				if neighbourCount == 3 then 
				{
					backBuffer[@x, y] = 1
				}
				else if neighbourCount == 0 then
				{
					if random(1) >= 0.05 then backBuffer[@x, y] = 1
				}
			}
		}
	}

	if frontBuffer == grid1 then 
	{
		frontBuffer = grid2
		backBuffer = grid1
	}
	else
	{
		frontBuffer = grid1
		backBuffer = grid2
	}
}