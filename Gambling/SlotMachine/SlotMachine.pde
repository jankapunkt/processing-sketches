PImage[] images;

public void setup()
{
  size(1000,1000,P2D);
  wheels = new Wheel[3];
  wheels[0] = new Wheel();
  wheels[1] = new Wheel();
  wheels[2] = new Wheel();
  
  for(int i=0;i<3;i++)
  {
    for(int j=0;j<3;j++)
    {
      grid[i][j] = 0; 
    } 
  }
  
  images = new PImage[9];
  images[0] = loadImage("10.png");
  images[1] = loadImage("j.png");
  images[2] = loadImage("q.png");
  images[3] = loadImage("k.png");
  images[4] = loadImage("a.png");
  images[5] = loadImage("dollar.png");
  images[6] = loadImage("euro.png");
  images[7] = loadImage("star.png");
  images[8] = loadImage("crown.png");  
}

public void draw()
{
  
}

/* ============================================================== */
/*                   CONSTANTS AND GLOBALS                        */
/* ============================================================== */

public float betinput=0.0;
public double account=100.0;

public final float PAYOUT=98.0;

public int lines = 1;

public int[][] grid = new int[3][3]; 


public final int SYMBOL_10       =0;    //
public final int SYMBOL_J        =1;    //
public final int SYMBOL_Q        =2;    //
public final int SYMBOL_K        =3;    //
public final int SYMBOL_A        =4;    //
public final int SYMBOL_DOLLAR   =5;    //
public final int SYMBOL_EURO     =6;    //
public final int SYMBOL_STAR     =7;    //
public final int SYMBOL_CROWN    =8;    //


public float getwin(int[] line, float bet)
{
   if(line[0] ==  SYMBOL_10 && line[1] == SYMBOL_10 && line[2] == SYMBOL_10)return 0.05;
   if(line[0] ==  SYMBOL_J && line[1] == SYMBOL_J && line[2] == SYMBOL_J)return 0.05;
   if(line[0] ==  SYMBOL_Q && line[1] == SYMBOL_Q && line[2] == SYMBOL_Q)return 0.05;
   
   if(line[0] ==  SYMBOL_K && line[1] == SYMBOL_K && line[2] == SYMBOL_K)return 0.1;
   if(line[0] ==  SYMBOL_A && line[1] == SYMBOL_A && line[2] == SYMBOL_A)return 0.1;
   
   if(line[0] ==  SYMBOL_DOLLAR && line[1] == SYMBOL_DOLLAR && line[2] == SYMBOL_DOLLAR)return 0.5;
   if(line[0] ==  SYMBOL_EURO && line[1] == SYMBOL_EURO && line[2] == SYMBOL_EURO)return 1.0;
   if(line[0] ==  SYMBOL_DOLLAR && line[1] == SYMBOL_DOLLAR && line[2] == SYMBOL_DOLLAR)return 2.0;
   if(line[0] ==  SYMBOL_EURO && line[1] == SYMBOL_EURO && line[2] == SYMBOL_EURO)return 5.0;
   
   return 0.0;
}


Wheel[] wheels;

public class Symbol
{
 public Symbol(){} 
  
 public float posx,posy;
 
 public int value;
 
 public PImage image;
 
 public void update(){}
 
 public void display(){}
}


public double[] chances = 
{
   
};

public void dice(float bet)
{
   account = account - bet;
   betinput= betinput + bet;
   
   wheels[0].spin();
   wheels[1].spin();
   wheels[2].spin();
   
   fillscreen(0,wheels[0].read());
   
   fillscreen(1,wheels[1].read());
   
   fillscreen(2,wheels[2].read());
   
   printWheels();
}




class Wheel
{
  int[] slots=new int[90];
  int internal;
  
  public Wheel()
  {
    internal = round(random(0,100)%9); //somewhere
    for(int i=0;i<81;i++)
    {
       if(i>0 && i<20)slots[i]=0;
       if(i>20 && i<35)slots[i]=1;
       if(i>35 && i<50)slots[i]=2;
       if(i>50 && i<62)slots[i]=3;
       if(i>62 && i<74)slots[i]=4;
       if(i>74 && i<84)slots[i]=5;
       if(i>84 && i<91)slots[i]=6;
       if(i>91 && i<97)slots[i]=7;
       if(i>97 && i<100)slots[i]=8;
    }
  for (int i = 80; i > 0; i--)
    {
      int index = round(random(0,i + 1));
      // Simple swap
      int a = slots[index];
      slots[index] = slots[i];
      slots[i] = a;
    }
  }
  
  void spin()
  {
    int spin = round(random(0,81));
    for(int i=0;i<spin;i++)
    {
      internal++;
      if(internal>81)internal=0;
    }
  }
  
  int[] read()
  {
    int prev = internal-1;
    int next = internal+1;
    if(prev<0)prev=81;
    if(next>81)next=0;
    
    int[] ret = new int[3];
    ret[0] = slots[prev];
    ret[1] = slots[internal];
    ret[2] = slots[next];
    return ret;
  }
  
}


void printWheels()
{
  for(int i=0;i<3;i++)
  {
    for(int j=0;j<3;j++)
    {
       image(images[grid[i][j]], i*300, j*300);
    } 
  }
}

void fillscreen(int col, int[] wheel)
{
       for (int i = 0; i < 3; i++)
       {
          grid[i][col] = wheel[i];
       } 
}

void keyPressed()
{
   switch(key)
  {
     case 'a':
       dice(0.2);
       break;
  }   
}
