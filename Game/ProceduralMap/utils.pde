public static double rand(int min, int max)
{
    return Math.random() * (max - min) + min;
}


public static int[] get_allNeighbours(int index, int gridSize)
{
    int[] result = new int[8]; 
    result[0] = get_neighbour(index, gridSize, NEI_TOP, NEI_LEFT);
    result[1] = get_neighbour(index, gridSize, NEI_TOP, NEI_CEN);
    result[2] = get_neighbour(index, gridSize, NEI_TOP, NEI_RIGHT);
    result[3] = get_neighbour(index, gridSize, NEI_MID, NEI_LEFT);
    result[4] = get_neighbour(index, gridSize, NEI_MID, NEI_RIGHT);
    result[5] = get_neighbour(index, gridSize, NEI_BOT, NEI_LEFT);
    result[6] = get_neighbour(index, gridSize, NEI_BOT, NEI_CEN);
    result[7] = get_neighbour(index, gridSize, NEI_BOT, NEI_RIGHT);
    return result;
}

/**
 Receives all neighbours in a reduced grid and sums their values.
 **/
public static int get_sumAllNeighbours(int index, int gridSize, int[] source)
{
    int result = 0; 
    int r0 = get_neighbour(index, gridSize, NEI_TOP, NEI_LEFT);
    if (r0 >-1 && source[r0]==1)
        result++;
    int r1 = get_neighbour(index, gridSize, NEI_TOP, NEI_CEN);
    if (r1 >-1 && source[r1]==1)
        result++;
    int r2 = get_neighbour(index, gridSize, NEI_TOP, NEI_RIGHT);
    if (r2 >-1 && source[r2]==1)
        result++;
    int r3 = get_neighbour(index, gridSize, NEI_MID, NEI_LEFT);
    if (r3 >-1 && source[r3]==1)
        result++;
    int r4 = get_neighbour(index, gridSize, NEI_MID, NEI_RIGHT);
    if (r4 >-1 && source[r4]==1)
        result++;
    int r5 = get_neighbour(index, gridSize, NEI_BOT, NEI_LEFT);
    if (r5 >-1 && source[r5]==1)
        result++;
    int r6 = get_neighbour(index, gridSize, NEI_BOT, NEI_CEN);
    if (r6 >-1 && source[r6]==1)
        result++;
    int r7 = get_neighbour(index, gridSize, NEI_BOT, NEI_RIGHT);
    if (r7 >-1 && source[r7]==1)
        result++;
    return result;
}



public static int get_neighbour(int index, int gridWidth, int vert, int hor)
{
    int i = get_i(index, gridWidth) + vert;
    int j = get_j(index, gridWidth) + hor;
    if (isInGrid(i, j, gridWidth, gridWidth))
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



//-------------------------------------------------------------------------
//
//
//    TEST UTILS
//
//
//-------------------------------------------------------------------------

public class TestUtils extends TestBase
{
    public TestUtils()
    {
        //empty
    }


    protected void test_rand() throws Exception
    {   
        double rand_no_value = rand(0, 0);
        asserter.eq(rand_no_value, 0.0, "unexpected random value");

        double rand_simple = rand(0, 10);
        asserter.gt(rand_simple, 0.0, "unexpected random value");
        asserter.lt(rand_simple, 10.0, "unexpected random value");

        double rand_simple_neg = rand(-100, 100);
        asserter.gt(rand_simple_neg, -100.0, "unexpected random value");
        asserter.lt(rand_simple_neg, 100.0, "unexpected random value");
    }

    protected void test_get_allNeighbours() throws Exception
    {
        throw new Exception("not yet implemented");
    }

    protected void test_get_neighbour() throws Exception
    {
        // 0 1 2
        // 3 4 5
        // 6 7 8
        int[] grid = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}; //3x3 grid
        int len = 3;

        asserter.eq(get_neighbour(0, len, NEI_TOP, NEI_LEFT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_TOP, NEI_CEN), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_TOP, NEI_RIGHT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_MID, NEI_LEFT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_MID, NEI_RIGHT), 1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_BOT, NEI_LEFT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_BOT, NEI_CEN), 3, "unexpected neighbor index");
        asserter.eq(get_neighbour(0, len, NEI_BOT, NEI_RIGHT), 4, "unexpected neighbor index");


        asserter.eq(get_neighbour(4, len, NEI_TOP, NEI_LEFT), 0, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_TOP, NEI_CEN), 1, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_TOP, NEI_RIGHT), 2, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_MID, NEI_LEFT), 3, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_MID, NEI_RIGHT), 5, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_BOT, NEI_LEFT), 6, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_BOT, NEI_CEN), 7, "unexpected neighbor index");
        asserter.eq(get_neighbour(4, len, NEI_BOT, NEI_RIGHT), 8, "unexpected neighbor index");

        asserter.eq(get_neighbour(8, len, NEI_TOP, NEI_LEFT), 4, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_TOP, NEI_CEN), 5, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_TOP, NEI_RIGHT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_MID, NEI_LEFT), 7, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_MID, NEI_RIGHT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_BOT, NEI_LEFT), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_BOT, NEI_CEN), -1, "unexpected neighbor index");
        asserter.eq(get_neighbour(8, len, NEI_BOT, NEI_RIGHT), -1, "unexpected neighbor index");
    }

    protected void test_get_sumAllNeighbours() throws Exception
    {
        throw new Exception("not yet implemented");
    }

    protected void test_get_j() throws Exception
    {
        int[] grid = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}; //3x3 grid
        int len = 3;

        asserter.eq(get_j(0, len), 0, "unexpected j index");
        asserter.eq(get_j(1, len), 1, "unexpected j index");
        asserter.eq(get_j(2, len), 2, "unexpected j index");

        asserter.eq(get_j(3, len), 0, "unexpected j index");
        asserter.eq(get_j(4, len), 1, "unexpected j index");
        asserter.eq(get_j(5, len), 2, "unexpected j index");

        asserter.eq(get_j(6, len), 0, "unexpected j index");
        asserter.eq(get_j(7, len), 1, "unexpected j index");
        asserter.eq(get_j(8, len), 2, "unexpected j index");
    }

    protected void test_get_k() throws Exception
    {
        int[] grid = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}; //3x3 grid
        int len = 3;

        asserter.eq(get_k(0, 0, len), 0, "unexpected k index");
        asserter.eq(get_k(0, 1, len), 1, "unexpected k index");
        asserter.eq(get_k(0, 2, len), 2, "unexpected k index");

        asserter.eq(get_k(1, 0, len), 3, "unexpected k index");
        asserter.eq(get_k(1, 1, len), 4, "unexpected k index");
        asserter.eq(get_k(1, 2, len), 5, "unexpected k index");

        asserter.eq(get_k(2, 0, len), 6, "unexpected k index");
        asserter.eq(get_k(2, 1, len), 7, "unexpected k index");
        asserter.eq(get_k(2, 2, len), 8, "unexpected k index");
    }

    protected void test_get_i() throws Exception
    {
        int[] grid = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}; //3x3 grid
        int len = 3;

        asserter.eq(get_i(0, len), 0, "unexpected i index");
        asserter.eq(get_i(1, len), 0, "unexpected i index");
        asserter.eq(get_i(2, len), 0, "unexpected i index");

        asserter.eq(get_i(3, len), 1, "unexpected i index");
        asserter.eq(get_i(4, len), 1, "unexpected i index");
        asserter.eq(get_i(5, len), 1, "unexpected i index");

        asserter.eq(get_i(6, len), 2, "unexpected i index");
        asserter.eq(get_i(7, len), 2, "unexpected i index");
        asserter.eq(get_i(8, len), 2, "unexpected i index");
    }

    protected void test_isInGrid() throws Exception
    {
        int[] grid = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}; //3x3 grid
        int len = 3;

        asserter.eq(isInGrid(0, -1, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(0, -2, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-1, 0, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-1, -1, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-1, -2, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-2, 0, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-2, -1, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(-2, -2, len, len), false, "unexpected boolean value");

        asserter.eq(isInGrid(0, 0, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(0, 1, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(0, 2, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(1, 0, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(1, 1, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(1, 2, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(2, 0, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(2, 1, len, len), true, "unexpected boolean value");
        asserter.eq(isInGrid(2, 2, len, len), true, "unexpected boolean value");

        asserter.eq(isInGrid(3, 0, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(3, 1, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(3, 2, len, len), false, "unexpected boolean value");

        asserter.eq(isInGrid(1, 3, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(1, 4, len, len), false, "unexpected boolean value");
        asserter.eq(isInGrid(1, 5, len, len), false, "unexpected boolean value");
    }
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