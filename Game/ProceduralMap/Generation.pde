
/**
 Generates one iteration step of conway's game of life by the following rules:
 1.Any live cell with fewer than two live neighbours dies, as if caused by under-population.
 2.Any live cell with two or three live neighbours lives on to the next generation.
 3.Any live cell with more than three live neighbours dies, as if by over-population.
 4.Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
 
 @param grid the source grids values where one represents a living and zero represents a dead cell.
 @param gridSize the size of one dimension of the 2d grid
 @returns an array of integers with either one or zero values.
 **/
public static int[] generate_gameOfLife(int[] grid, int gridSize)
{
    int len=grid.length;
    int[] result = new int[len];
    int sum;
    println("[generate_gameOfLife]: size="+gridSize);
    for (int i=0; i<len; i++)
    {
        sum = get_sumAllNeighbours(i, gridSize, grid);

        if (grid[i]==1 && sum < 2) //1.
        {
            result[i]=0;
            continue;
        }
        if (grid[i]==1 && (sum == 2 || sum == 3)) //2
        {
            result[i]=1;
            continue;
        }
        if (grid[i]==1 && sum > 3) //3.
        {
            result[i]=0;
            continue;
        }
        if (grid[i]==0 && sum == 3) //4.
        {
            result[i]=1;
            continue;
        }
    }

    return result;
}


//=================================================================================================================//

/**
 1.Start with a rectangular dungeon.
 2.Choose a random direction (horizontal or vertical) and location (x for vertical or y for horizontal).
 3.Split the dungeon into two sub-dungeons using the parameters obtained in step 2.
 4.Pick a random sub-rectangle and repeat step 2 for n iterations.
 5.After n iterations, place random sized rooms in each of the rectangles.
 6.Connect each room by looping through all the split rectangles and connect each split sub-regions.
 **/
public static int[] generate_bspTree(int gridSize)
{
    int[] results = new int[gridSize*gridSize];

    return results;
}


//=================================================================================================================//

/**
 1.Fill the whole map with solid earth
 2.Dig out a single room in the centre of the map
 3.Pick a wall of any room
 4.Decide upon a new feature to build
 5.See if there is room to add the new feature through the chosen wall
 6.If yes, continue. If no, go back to step 3
 7.Add the feature through the chosen wall
 8.Go back to step 3, until the dungeon is complete
 **/
public static int[] generate_procedurallyBuild(int gridSize)
{
    return null;
}


//=================================================================================================================//

public static int[] generate_randomRoomPlacement()
{
    return null;
}


//=================================================================================================================//

/** 
 Returns an Array with position indices from the following algorithm:
 
 1 Pick a random point on a filled grid and mark it empty.
 2 Choose a random cardinal direction (N, E, S, W).
 3 Move in that direction, and mark it empty unless it already was.
 4 Repeat steps 2-3, until you have emptied as many grids as desired.
 
 @param initialPosX start x
 @param initialPosY start y
 @param size see step 4
 @param gridSize the dimension of the grid
 **/
public static int[] generate_drunkardWalk(int initialPosX, int initialPosY, int size, int gridSize, boolean clean)
{
    int count=0;  
    byte[] marks = new byte[gridSize*gridSize]; //marked positions in the grid
    int[] results = new int[size];

    int currentX = initialPosX;
    int currentY = initialPosY;
    println("[generate_drunkardWalk]: grid="+gridSize+" size="+size+" startx="+currentX+" starty="+currentY);
    while (count<size)
    {
        int pos = currentY + (currentX*gridSize);
        if (pos > 0 || pos < marks.length && marks[pos] == 0x00)
        {
            marks[pos] = 0x01;  //mark position as filled
            results[count] = pos; //add to results
            count++;
        }


        int dir = -1;
        while (dir == -1)
        {
            dir = (int)Math.floor(rand(0, 4));
            if (dir == 0)currentX--;
            if (dir == 1)currentX++;
            if (dir == 2)currentY--;
            if (dir == 3)currentY++;

            if (clean && !isInGrid(currentX, currentY, gridSize, gridSize))
            {
                println("not in grid: " + currentX + " " + currentY + " " + gridSize);
                dir = -1;
            }
        }
    }

    return results;
}


//=================================================================================================================//

public static int[] generate_random(int percent, int gridSize)
{
    float propability = percent/100f;
    int[] result = new int[(int)(gridSize*gridSize*propability)];
    println("[getRandom]: %="+percent+" size="+gridSize+" p="+propability+" res="+result.length);
    int count = 0;
    int len = gridSize*gridSize;
    for (int i=0; i<len; i++)
    {
        float perc = (float)rand(0, 1);
        if (perc <= propability && count < result.length)
        {
            result[count++] = i;
        }
    }
    return result;
}


//=================================================================================================================//



/**
 http://www.futuredatalab.com/proceduraldungeon/
 **/

public static int[] generate_cellularCave(int gridSize)
{

    int percentFill     = 45;
    int firstIteration  = 3;
    int firstCutoff1    = 4;
    int firstCutoff2    = 5;
    int secondteration  = 1;
    int secondCutoff1   = 5;
    int secondCutoff2   = 3;

    //map sources and results
    int[] map = new int[gridSize*gridSize]; //marked positions in the grid
    int[] results = new int[map.length];

    int len = map.length;
    float propability = percentFill/100f;

    for (int i=0; i<len; i++)
    {
        float perc = (float)rand(0, 1);
        map[i] = perc <= propability ? 1 : 0;
        results[i] = -1;
    }
    println("[getRandom]: %="+percentFill+" size="+gridSize+" p="+propability+" res="+results.length);

    cellularIteration(map, results, firstIteration, firstCutoff1, firstCutoff2, gridSize, percentFill);
    cellularIteration(map, results, secondteration, secondCutoff1, secondCutoff2, gridSize, percentFill);
    return results;
}


public static int[] cellularIteration(int[] source, int[] results, int iterations, int cutoff1, int cutoff2, int gridSize, int percentFill)
{
    int len = source.length;
    int i=0, j=0;
    for (i=0; i<iterations; i++)
    {
        for (j=0; j<len; j++)
        {
            if (j<(gridSize*percentFill/100))
            {
                results[j] = j;
                source[j]  = 1;
            }

            int sum = get_sumAllNeighbours(j, gridSize, source);

            if (source[j] == 1 && sum >= cutoff1)      // T is already filled *and* at least 4 of its neighbors are filled
            {
                results[j] = j;
                source[j]  = 1;
            } else if (source[j]==0 && sum >= cutoff2) { // T is not yet filled *and* at least 5 of its neighbors are filled
                results[j] = j;
                source[j]  = 1;
            } else {
                results[j] = -1;
                source[j]=0;
            }
        }
    }
    return results;
}