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
      for(int i=0;i<gridSize;i++)
      {
         cells[i] = new Cell(i , floor(i / halfSize), i % halfSize, screenSize/halfSize);
      }
   }
   
   public void fill(int[] source)
   {
       for(int i=0;i<source.length;i++)
       {
          int idx = source[i];
          if (idx >= 0 && idx <= gridSize-1)this.cells[idx].isActive = true; 
       }
   }
   
   public void update()
   {
      float x = mouseX;
      float y = mouseY;
      for (int i=0;i<gridSize;i++)
      {
          Cell c = cells[i];
          if(!started)
          {
              c.update(x,y);
          }else{
              
            
          }
      }
   }
   
   public void display()
   {
      for (int i=0;i<gridSize;i++)
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
  
  public void update(float x, float y)
  {
     over = mouseOver(x,y);
     if (over && mousePressed )
     {
        isActive = mouseButton == LEFT ? true : false;
     }
  }
  
  private boolean mouseOver(float x, float y)
  {
     return  x >= xpos && x < xpos + csize &&
             y >= ypos && y < ypos + csize;
  }
    
  public void display()
  {
     if (isActive || over)
     {
        col = 200; 
     }else if(col > 50){
        //col-=10;
        col=50;
     }
     pushMatrix();
       translate(xpos, ypos);
       fill(col);
       stroke(200);
       rect(0,0,csize,csize);
      popMatrix();
  }
}