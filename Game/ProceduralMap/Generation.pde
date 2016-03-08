
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
  int secondCutoff1   = 5;
  int secondCutoff2   = -1;
  
  
  //map sources and results
  int[] map = new int[gridSize*gridSize]; //marked positions in the grid
  int[] results = new int[map.length]; //Math.round(map.length*percentFill/100)]; //use normal distribution for percent fill
  
  int len = map.length;
  
  for(int i=0;i<len;i++)
  {
     map[i] = (int)Math.round(rand(0,1));
     results[i] = -1;
  }
  results = cellularIteration(map, results, firstIteration, firstCutoff1, firstCutoff2, gridSize);
  results = cellularIteration(map, results, secondteration, secondCutoff1, secondCutoff2, gridSize);
  return results;
}


public static int[] cellularIteration(int[] source, int[] results, int iterations, int cutoff1, int cutoff2, int gridSize)
{
    int len = source.length;
    int i=0,j=0;
    for(i=0;i<iterations;i++)
    {
      for (j=0;j<len;j++)
      {
        int[] alln = get_allNeighbours(j, gridSize);
        int sum=0;
        for(int n : alln)
        {
           if (n >-1 && source[n]==1)sum++;
        }
        // T is already filled *and* at least 4 of its neighbors are filled
        if (source[j] == 1 && sum >= cutoff1)
        {
            results[j] = j;
            source[j]  = 1;
        }else if(source[j]==0 && sum >= cutoff2) {// T is not yet filled *and* at least 5 of its neighbors are filled
            results[j] = j;
            source[j]  = 1;
        }else{
           results[j] = -1;
           source[j]=0;
        }
      }
    }
    return results;
}