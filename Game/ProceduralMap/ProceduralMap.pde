import java.lang.reflect.*;
import java.math.BigDecimal;

public Grid grid;
public boolean started=false;


void setup()
{
    size(600, 600, P2D); 
    grid = new Grid(SIZE, CELLS);
    println("create new grid: "+grid.cells.length);

    //uncomment if not testing
    runTests();
}


void draw()
{
    background(50);
    grid.update();
    grid.display();
}


void keyPressed()
{
    switch(key)
    {
    case ENTER:
        grid.fill_grid(generate_gameOfLife(grid.getActiveCells(), CELLS));
        break;
    case 'f':
        grid.flush();
        break;
    case 'd':
        grid.fill_indices(generate_drunkardWalk(20, 10, 300, CELLS, false));
        break;
    case 'r':
        grid.fill_indices(generate_random(10, CELLS));
        break;

    case 'c':
        grid.fill_indices(generate_cellularCave(CELLS));
        break;
    }
}


private void runTests()
{
    noLoop();

    TestUtils tu = new TestUtils();
    tu.run(TestUtils.class);

    TestGrid tg = new TestGrid();
    tg.run(TestGrid.class);

    TestCell tc = new TestCell();
    tg.run(TestCell.class);
}