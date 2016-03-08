
/** 
  Returns an Array with position indices from the following algorithm:
  
   1 Pick a random point on a filled grid and mark it empty.
   2 Choose a random cardinal direction (N, E, S, W).
   3 Move in that direction, and mark it empty unless it already was.
   4 Repeat steps 2-3, until you have emptied as many grids as desired.

  @param textureKey The key of the texture to fill
  @param initialPosX start x
  @param initialPosY start y
  @param size see step 4
  @param gridSize the dimension of the grid
**/
public static int[] generate_drunkardWalk(int initialPosX, int initialPosY, int size, int gridSize)
{
  int count=0;  
  byte[] marks = new byte[gridSize*gridSize]; //marked positions in the grid
  
  int[] results = new int[size];
  
  int currentX = initialPosX;
  int currentY = initialPosY;
  
  while(count<size)
  {
      int pos = currentY + (currentX*gridSize);
      if (marks[pos] == 0x00)
      {
        marks[pos] = 0x01;  //mark position as filled
        results[count] = pos; //add to results
        count++;
      }
      
      //anyway look for a new direction
      int dir = (int)(rand(0,3));
      if (dir == 0)currentX--;
      if (dir == 1)currentX++;
      if (dir == 2)currentY--;
      if (dir == 3)currentY++;
  }
  
  return results;
}


public static int[] generate_randomRoomPlacement()
{
   return null; 
}



/**
    http://www.futuredatalab.com/proceduraldungeon/
**/

public static int[] generate_cellularAutomata(int gridSize)
{

  
  int percentFill     = 40;
  int firstIteration  = 4;
  int firstCutoff1    = 5;
  int firstCutoff2    = 2;
  int secondteration  = 3;
  int secondCutoff1    = 5;
  int secondCutoff2    = -1;
  
  
  //map sources and results
  int[] map = new int[gridSize*gridSize]; //marked positions in the grid
  int[] results = new int[Math.round(map.length*percentFill/100)];
  
  int len = map.length;
  int i=0,j=0;
  
  for(i=0;i<len;i++)
  {
     map[i] = (int)Math.round(Math.random());
  }
  
  
  for(i=0;i<firstIteration;i++)
  {
      for (j=0;j<len;j++)
      {
        //1. A tile T becomes a wall if 5 or more of the tiles within one step of T are walls.
        //2. A tile T becomes a wall if 2 or less of the tiles within two step of T are walls.
        int neighbour_topleft    = getNeighbour(j, gridSize, -1, -1);
        int neighbour_topMid     = getNeighbour(j, gridSize, -1, -1);
        int neighbour_topRight   = getNeighbour(j, gridSize, -1, -1);
        int neighbour_midleft    = getNeighbour(j, gridSize, -1, -1);
        int neighbour_midMid     = getNeighbour(j, gridSize, -1, -1);
        int neighbour_midRight   = getNeighbour(j, gridSize, -1, -1);
        int neighbour_botLeft    = getNeighbour(j, gridSize, -1, -1);
        int neighbour_botMid     = getNeighbour(j, gridSize, -1, -1);
        int neighbour_botRight   = getNeighbour(j, gridSize, -1, -1);
      }
  }
  
  
   return null;
}