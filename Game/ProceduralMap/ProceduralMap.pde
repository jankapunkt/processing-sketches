/* GLOBALS */
public static final short TILE_SIZE = 64;  //using 64 pixel tiles
public static final short GRID_SIZE = 128; //in tiles
public static final short[][]grid = new short[GRID_SIZE][GRID_SIZE];

public float scale=1.0f;

/* TILE PATHS */
public static final String TEX_GRASS     = "grass.png";
public static final String TEX_FOREST    = "forest.png";
public static final String TEX_GROUND_D  = "ground_dark.png";
public static final String TEX_GROUND_L  = "ground_light.png";
public static final String TEX_GROUND    = "ground.png";
public static final String TEX_WATER_D   = "water_deep.png";
public static final String TEX_WATER_F   = "water_flat.png";

public TileManager tileManager;

public float offsetX,offsetY;

void setup()
{
    size(1600,1000,P2D);
    frameRate(60);
    tileManager = new TileManager(TILE_SIZE,GRID_SIZE);
    tileManager.addImage(TEX_GRASS);
    tileManager.addImage(TEX_FOREST);
    tileManager.addImage(TEX_GROUND_D);
    tileManager.addImage(TEX_GROUND_L);
    tileManager.addImage(TEX_GROUND);
    tileManager.addImage(TEX_WATER_D);
    tileManager.addImage(TEX_WATER_F);

    for(int i=0; i<GRID_SIZE;i++)
    {
      for(int j=0; j<GRID_SIZE;j++)
      {
          tileManager.addTile(i,j,0,TEX_GRASS);
      }  
    }
    
    int[] gen = generate_drunkardWalk(GRID_SIZE/2, GRID_SIZE/2, 1000, GRID_SIZE);
    for (int j=0;j<gen.length;j++)
    {
       tileManager.addTile(gen[j],0,TEX_WATER_F);
    }

    
    offsetX = 0;
    offsetY = 0;
    
    
    int[] a = new int[]{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
    
    int index = 11;
    println("------------------------");
    println("neighbours for: "+a[index]);
    
    print(getNeighbour(index, 4, -1,  -1)+"\t");
    print(getNeighbour(index, 4, -1,  0)+"\t");
    println(getNeighbour(index, 4, -1,  1)+"\t");
    print(getNeighbour(index, 4,  0, -1)+"\t");
    print("["+index+"]"+"\t");
    println(getNeighbour(index, 4,  0,  1)+"\t");
    print(getNeighbour(index, 4,  1, -1)+"\t");
    print(getNeighbour(index, 4,  1,  0)+"\t");
    print(getNeighbour(index, 4,  1,  1)+"\t");
  
}


void draw()
{
     if (mousePressed)
     {
       println(mouseX-pmouseX);
        offsetX += ( mouseX-pmouseX ); 
        offsetY += ( mouseY-pmouseY );
     }
    background(255);
    pushMatrix();
      
      translate((-width/2)*scale+offsetX,(-height/2)*scale+offsetY);
      scale(scale);
      tileManager.display();
      drawGrid();
    
   popMatrix();
}



void drawGrid()
{  
   fill(0,0,0,0);
   stroke(0);
   for(int i=0;i<GRID_SIZE;i++)
   {
     for(int j=0;j<GRID_SIZE;j++)
     {
         rect(i*TILE_SIZE,j*TILE_SIZE,TILE_SIZE,TILE_SIZE);
     }
   }
   
}

void mouseWheel(MouseEvent event) {
  float w = event.getCount();
  scale = scale + w/10;
  println(scale+" "+w);
}