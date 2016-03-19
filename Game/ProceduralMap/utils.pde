public static double rand(int min, int max)
{
    return Math.random() * (max - min) + min;
}


public static int[] get_allNeighbours(int index, int gridSize)
{
   int[] result = new int[8]; 
   result[0] = get_neighbour(index, gridSize,NEI_TOP, NEI_LEFT);
   result[1] = get_neighbour(index, gridSize,NEI_TOP, NEI_CEN);
   result[2] = get_neighbour(index, gridSize,NEI_TOP, NEI_RIGHT);
   result[3] = get_neighbour(index, gridSize,NEI_MID, NEI_LEFT);
   result[4] = get_neighbour(index, gridSize,NEI_MID, NEI_RIGHT);
   result[5] = get_neighbour(index, gridSize,NEI_BOT, NEI_LEFT);
   result[6] = get_neighbour(index, gridSize,NEI_BOT, NEI_CEN);
   result[7] = get_neighbour(index, gridSize,NEI_BOT, NEI_RIGHT);
   return result;
}

/**
Receives all neighbours in a reduced grid and sums their values.
**/
public static int get_sumAllNeighbours(int index, int gridSize, int[] source)
{
   int result = 0; 
   int r0 = get_neighbour(index, gridSize,NEI_TOP, NEI_LEFT);
   if (r0 >-1 && source[r0]==1)result++;
   int r1 = get_neighbour(index, gridSize,NEI_TOP, NEI_CEN);
   if (r1 >-1 && source[r1]==1)result++;
   int r2 = get_neighbour(index, gridSize,NEI_TOP, NEI_RIGHT);
   if (r2 >-1 && source[r2]==1)result++;
   int r3 = get_neighbour(index, gridSize,NEI_MID, NEI_LEFT);
   if (r3 >-1 && source[r3]==1)result++;
   int r4 = get_neighbour(index, gridSize,NEI_MID, NEI_RIGHT);
   if (r4 >-1 && source[r4]==1)result++;
   int r5 = get_neighbour(index, gridSize,NEI_BOT, NEI_LEFT);
   if (r5 >-1 && source[r5]==1)result++;
   int r6 = get_neighbour(index, gridSize,NEI_BOT, NEI_CEN);
   if (r6 >-1 && source[r6]==1)result++;
   int r7 = get_neighbour(index, gridSize,NEI_BOT, NEI_RIGHT);
   if (r7 >-1 && source[r7]==1)result++;
   return result;
}



public static int get_neighbour(int index, int gridWidth, int vert, int hor)
{
   int i = get_i(index, gridWidth) + vert;
   int j = get_j(index, gridWidth) + hor;
   if (isInGrid(i,j,gridWidth, gridWidth))
       return i * gridWidth + j;
   else
       return -1;
}


public static boolean isInGrid(int i, int j, int gridWidth, int gridHeight)
{
   return (i >= 0 && j >= 0 && i < gridWidth && j <  gridHeight);
}

public static int get_k(int i, int j, int gridWidth)
{
    return i * gridWidth + j; 
}


public static int get_i(int index, int gridWidth)
{
  return floor((index / gridWidth));
}


public static int get_j(int index, int gridWidth)
{
   return index % gridWidth;
}



public static void print_neightbours(int index, int gridWidth)
{
  print  ( "[" + get_neighbour(index, gridWidth, NEI_TOP, NEI_LEFT) +"]" + "\t");
  print  ( "[" + get_neighbour(index, gridWidth, NEI_TOP, NEI_CEN) +"]" + "\t");
  println( "[" + get_neighbour(index, gridWidth, NEI_TOP, NEI_RIGHT) +"]" + "\t");
  
  print  ( "[" + get_neighbour(index, gridWidth, NEI_MID, NEI_LEFT) +"]" + "\t");
  print  ( "[" + get_neighbour(index, gridWidth, NEI_MID, NEI_CEN) +"]" + "\t");
  println( "[" + get_neighbour(index, gridWidth, NEI_MID, NEI_RIGHT) +"]" + "\t");
  
  print  ( "[" + get_neighbour(index, gridWidth, NEI_BOT, NEI_LEFT) +"]" + "\t");
  print  ( "[" + get_neighbour(index, gridWidth, NEI_BOT, NEI_MID) +"]" + "\t");
  println( "[" + get_neighbour(index, gridWidth, NEI_BOT, NEI_RIGHT) +"]" + "\t");
}