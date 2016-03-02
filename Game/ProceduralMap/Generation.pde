
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
  byte[] marks = new byte[gridSize*gridSize];
  
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
      int dir = (int)rand(0,3);
      if (dir == 0)currentX--;
      if (dir == 1)currentX++;
      if (dir == 2)currentY--;
      if (dir == 3)currentY++;
  }
  
  return results;
}


public static double rand(int min, int max)
{
    return Math.random() * (max - min) + min;
}