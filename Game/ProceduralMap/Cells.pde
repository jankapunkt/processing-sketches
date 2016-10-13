class Grid
{
    public final Cell[] cells;
    public final int gridSize;
    public final int halfSize;

    public Grid(int screenSize, int halfSize)
    {
        this.halfSize = halfSize;
        gridSize = halfSize*halfSize;
        cells = new Cell[gridSize];
        for (int i=0; i<gridSize; i++)
        {
            cells[i] = new Cell(i, get_i(i, halfSize), get_j(i, halfSize), screenSize/halfSize);
        }
    }

    public void flush()
    {
        for (int i=0; i<gridSize; i++)
        {
            cells[i].isActive = false;
        }
    }

    public int[] getActiveCells()
    {
        int[] result = new int[gridSize];
        for (int i=0; i<gridSize; i++)
        {
            result[i] = cells[i].isActive ? 1 : 0;
        }
        return result;
    }

    public void setCells(int[] source) throws Exception
    {
        if (source.length > gridSize)
            throw new Exception("Gridsize is not backed by source");
        for (int i=0; i<gridSize; i++)
        {
            cells[i].isActive = source[i] == 1 ? true : false;
        }
    }

    public void setCellsByIndices(int[] source) throws Exception
    {
        if (source.length > gridSize)
            throw new Exception("Gridsize is not backed by source");
        for (int i=0; i<source.length; i++)
        {
            int idx = source[i];
            if (idx >= 0 && idx <= gridSize-1)
                cells[idx].isActive = true;
        }
    }


    public void update(float x, float y, boolean msPressed, int msButton)
    {
        for (int i=0; i<gridSize; i++)
        {
            cells[i].update(x, y, msPressed, msButton);
        }
    }

    public void display()
    {
        for (int i=0; i<gridSize; i++)
        {
            cells[i].display();
        }
    }
}



class Cell
{
    public final int index;
    public final int xindex;
    public final int yindex;
    public final int csize;

    public final int xpos;
    public final int ypos;

    public boolean over;
    public boolean isCandidate;
    public boolean isActive;

    private int col=50;

    public Cell(int cellIndex, int xindex, int yindex, int csize)
    {
        this.index = cellIndex;
        this.xindex = xindex;
        this.yindex = yindex;
        this.csize = csize;
        this.xpos = xindex*csize;
        this.ypos = yindex*csize;
    }

    public void update(float x, float y, boolean msPressed, int msButton)
    {
        over = mouseOver(x, y);
        if (over && msPressed )
        {
            isActive = msButton == LEFT ? true : false;
        }
    }

    private boolean mouseOver(float x, float y)
    {
        return  
            x >= xpos && x < xpos + csize &&
            y >= ypos && y < ypos + csize;
    }

    public void display()
    {
        if (isActive || over)
        {
            col = 200;
        } else if (col > 50) {
            //col-=10;
            col=50;
        }
        pushMatrix();
        translate(xpos, ypos);
        fill(col);
        stroke(200);
        rect(0, 0, csize, csize);
        popMatrix();
    }
}


//-------------------------------------------------------------------------
//
//
//    TEST GRID
//
//
//-------------------------------------------------------------------------

public class TestGrid extends TestBase
{
    public TestGrid()
    {
        //empty
    }

    public void test_flush() throws Exception
    {
        Grid grid = new Grid(9, 3);
        grid.setCells(new int[]{1, 1, 1, 1, 1, 1, 1, 1, 1});

        Cell[] cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, true, "unexpected cell isActive value");
        }

        grid.flush();
        cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, false, "unexpected cell isActive value");
        }
    }

    public void test_getActiveCells() throws Exception
    {
        Grid grid = new Grid(9, 3);
        grid.setCells(new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0});

        int[] actives = grid.getActiveCells();
        for (int i=0; i<actives.length; i++)
        {
            asserter.eq(actives[i], 0, "unexpected cell isActive value");
        }

        grid.setCells(new int[]{1, 1, 1, 1, 1, 1, 1, 1, 1});
        actives = grid.getActiveCells();
        for (int i=0; i<actives.length; i++)
        {
            asserter.eq(actives[i], 1, "unexpected cell isActive value");
        }
    }

    public void test_setCells() throws Exception
    {
        Grid grid = new Grid(9, 3);
        grid.setCells(new int[]{1, 1, 1, 1, 1, 1, 1, 1, 1});

        Cell[] cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, true, "unexpected cell isActive value");
        }
    }

    public void test_setCellsByIndices() throws Exception
    {
        Grid grid = new Grid(9, 3);
        grid.setCells(new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0});
        grid.setCellsByIndices(new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8});

        Cell[] cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, true, "unexpected cell isActive value");
        }
    }

    public void test_update() throws Exception
    {
        Grid grid = new Grid(9, 3);
        grid.setCells(new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0});

        Cell[] cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, false, "unexpected cell isActive value");
        }

        for (int j=0; j<3; j++)
        {
            for (int k=0; k<3; k++)
            {
                grid.update(j*3, k*3, true, LEFT);
            }
        }

        cells = grid.cells;
        asserter.notNull(cells, "unexpected cells array value");
        asserter.gt(cells.length, 0, "unexpected cells array size");

        for (int i=0; i<cells.length; i++)
        {
            asserter.eq(cells[i].isActive, true, "unexpected cell isActive value");
        }
    }
}

//-------------------------------------------------------------------------
//
//
//    TEST CELL
//
//
//-------------------------------------------------------------------------

public class TestCell extends TestBase
{
    public TestCell()
    {
        //empty
    }

    public void test_update() throws Exception
    {
        int cellSize = 30;
        Cell c = new Cell(0, 0, 0, cellSize);
        asserter.eq(c.isActive, false, "unexpected isAcitve value");
        for (int i=0; i<cellSize; i++)
        {
            for (int j=0; j<cellSize; j++)
            {
                c.update(i, j, true, LEFT);
                asserter.eq(c.isActive, true, "unexpected isActive value");
                c.isActive = false;
            }
        }
    }

    public void test_mouseOver() throws Exception
    {
        int cellSize = 30;
        Cell c = new Cell(0, 0, 0, cellSize);

        for (int i=0; i<cellSize; i++)
        {
            for (int j=0; j<cellSize; j++)
            {
                asserter.eq(c.mouseOver(i, j), true, "unexpected mouseOver value");
            }
        }

        asserter.eq(c.mouseOver(-1, 0), false, "unexpected mouseOver value");
        asserter.eq(c.mouseOver(0, -1), false, "unexpected mouseOver value");

        asserter.eq(c.mouseOver(cellSize+1, 0), false, "unexpected mouseOver value");
        asserter.eq(c.mouseOver(0, cellSize+1), false, "unexpected mouseOver value");

        asserter.eq(c.mouseOver(cellSize+1, cellSize+1), false, "unexpected mouseOver value");
        asserter.eq(c.mouseOver(cellSize+1, cellSize+1), false, "unexpected mouseOver value");
    }
}