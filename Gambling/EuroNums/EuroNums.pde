import java.text.DecimalFormat;

//font instances
PFont fnormal, fbig;

//arrays to store the numbers and star numbers
int[] numbers;
int[] stars;

//length of numbers and stars
int numlen=1;
int starlen=1;

double chance=1;


//maxrange of numbers and stars
int numrange=50;
int starrange=8;


//format very big numbers in decimal form
DecimalFormat df;

void setup()
{
  df = new DecimalFormat("#");
  df.setMaximumFractionDigits(0);
  
  
  //init window
  size(1280,400);

  //create font styles  
  fnormal = createFont("Arial", 12);
  fbig    = createFont("Arial", 48);
  
  //init numbers
  numbers = new int[numlen];
  stars   = new int[starlen];
}


void draw()
{
  background(255);
  
  //headline
  fill(0);
  textFont(fnormal);
  textAlign(LEFT,CENTER);
  text("Enter = throw dice",5,20);
  text("D = numbers +1 | A = numbers -1 | W = stars +1 | S = stars -1",5,40);
  text("L = numbers-range +1 | J = numbers -1 | I = stars-range +1 | K = stars-range -1",5,60);
  textAlign(LEFT);
  text("Numbers:",5,height/3.5);
  text(new Integer(numlen).toString(), 120, height/3.5);
  text(" out of ",155,height/3.5);
  text(new Integer(numrange).toString(), 250, height/3.5);
  
  
  text("Stars:",5,height/2);
  
  
  //numbers rects
  fill(255);
  stroke(150);
  strokeWeight(3);
  for(int i=0;i<numbers.length;i++)
  {
    rect(100+i*100,height/3,100,50);  //spacing=20, width = 50
  }
  
  //numbers
  fill(0);
  stroke(0);
  textFont(fbig);
  textAlign(LEFT,TOP);
  for(int i=0;i<numbers.length;i++)
  {
    Integer num = new Integer(numbers[i]);
    text(num.toString(),100+i*100,height/3);
  }
  
  //stars rect
  fill(255);
  stroke(150);
  strokeWeight(3);
  for(int i=0;i<stars.length;i++)
  {
    rect(100+i*100,height/2,100,50);  //spacing=20, width = 50
  }
  
  //stars
  fill(0);
  stroke(0);
  textFont(fbig);
  textAlign(LEFT,TOP);
  for(int i=0;i<stars.length;i++)
  {
    Integer num = new Integer(stars[i]);
    text(num.toString(),100+i*100,height/2);
  }
}
