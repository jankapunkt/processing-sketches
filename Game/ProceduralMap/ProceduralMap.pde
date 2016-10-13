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
    grid.update(mouseX, mouseY, mousePressed, mouseButton);
    grid.display();
}


void keyPressed()
{
    switch(key)
    {
    case ENTER:
        try 
        {
            grid.setCells(generate_gameOfLife(grid.getActiveCells(), CELLS));
        }
        catch(Exception e) {
            //write to log
        }
        break;
    case 'f':
        grid.flush();
        break;
    case 'd':
        try
        {
            grid.setCellsByIndices(generate_drunkardWalk(20, 10, 300, CELLS, false));
        }
        catch(Exception e) {
            //write to log
        }
        break;
    case 'r':
        try
        {
            grid.setCellsByIndices(generate_random(10, CELLS));
        }
        catch(Exception e) {
            //write to log
        }
        break;

    case 'c':
        try
        {
            grid.setCellsByIndices(generate_cellularCave(CELLS));
        }
        catch(Exception e) {
            //write to log
        }
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
    tc.run(TestCell.class);
    
    TestGeneration tgen = new TestGeneration();
    tgen.run(TestGeneration.class);
}