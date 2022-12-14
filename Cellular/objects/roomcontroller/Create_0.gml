/// @description Insert description here
// You can write your code in this editor

randomise();

gridSize = 40
frameNo = 0

for(y = 0; y < gridSize; y++)
{
	for(x = 0; x < gridSize; x++)
	{	
		grid1[x, y] = 0
		grid2[x, y] = 0
		tiles[x, y] = instance_create_depth(x*33, y*33, 0, Tile)
		
		if irandom(3) == 1 then
		{
			genAmount = 0
			desX = -1
			desY = -1
			
			while(genAmount != 3)
			{	
				while((desX == x and desY == y) or 
				(desX < 0) or (desX > gridSize - 1) or
				(desY < 0) or (desY > gridSize - 1))
				{
					desX = irandom_range(x-1, x+1)
					desY = irandom_range(y-1, y+1)
				}
			
				grid1[desX, desY] = 1
				grid2[desX, desY] = 1
				genAmount++
			}
		}
	}
}

frontBuffer = grid1
backBuffer = grid2