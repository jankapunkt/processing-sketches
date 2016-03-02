class Tile
{
  public int posx, posy, zindex; 
  protected PImage tileImage;
  
  public Tile(int x, int y, int z, PImage img)
  {
     posx = x;
     posy = y;
     zindex = z;
     tileImage = img;
  }
  
  public void display()
  {
     pushMatrix();
       translate(posx, posy);
       image(tileImage,0,0);
     popMatrix();
  }
  
  public void setImage(PImage img)
  {
     tileImage = img; 
  }
  
  public void dispose()
  {
      tileImage = null;
  }
}


public class TileManager
{
  //hash all tile images for reuse
  protected final HashMap<String,PImage> images = new HashMap<String,PImage>();
    
  protected Tile[]grid;
  protected short tileSize;
  protected short gridSize;
  
  public TileManager(short tSize, short gSize)
  {
    tileSize = tSize;
    grid = new Tile[gSize*gSize];
    gridSize = gSize;
  }

  public void addImage(String path)
  {
      PImage tex = loadImage(path);
      images.put(path, tex);
  }
  
  public void addTile(int xindex, int yindex, int zindex, String imageKey)
  {
    
    int index = yindex + (xindex * gridSize);
    println(index+" "+GRID_SIZE*GRID_SIZE);
    if (grid[index] == null)
        grid[index] = new Tile(xindex*tileSize, yindex*tileSize, zindex, images.get(imageKey));
    else
    {
       Tile t = grid[index];
       t.setImage(images.get(imageKey));
    }
        
  }
  
  public void addTile(int index, int zindex, String imageKey)
  {
    
    println(index+" "+GRID_SIZE*GRID_SIZE);
    if (grid[index] == null)
    {
      return;
    }
    else
    {
       Tile t = grid[index];
       t.setImage(images.get(imageKey));
    }
        
  }
  
  public void display()
  {
     for (Tile t : grid)
     {
       if(t!=null)t.display();
     }
  }
  
}