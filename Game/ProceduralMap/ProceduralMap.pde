public final int SIZE = 600;
public final int CELLS = 60;

public Grid grid;
public boolean started=false;


void setup()
{
  size(600, 600, P2D); 
  grid = new Grid(SIZE, CELLS);
  println("create new grid: "+grid.cells.length);
  grid.fill(generate_cellularCave(CELLS));
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
    started=true;
    grid.fill(generate_cellularCave(CELLS));
    break;
  }
}