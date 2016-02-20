
//======================= WAVE PROPERTIES ====================================//
//
//
//
//=====================================================================//

//================  CONSTANTS ==================== //

// How far apart should each horizontal location be spacedb
final int xspacing =4;       

// total # of waves to add together
final int maxwaves = 3;       
final float amplitude = 110;

//speed will always be 343 m/s if we assume sound travels the air
final int SPEED=343;  

//color of the original wave
final color ORIGINAL_COLOR = color(255, 0, 255);

//color of the sum of both 
final color SUM_COLOR = color(255, 255, 0);

//color of the reflection wave
final color REF_COL = color(99, 99, 255);


//================  VARIABLES ==================== //
// Width of entire wave
int   w;   
float theta = 0.0;

// Value for incrementing X, to be calculated as a function of period and xspacing
float dx;      

// Using an array to store height values for the wave (not entirely necessary)
float[] vals1, vals2;
float[] yvalues;                           
//int[] steps;


float half_len=0;

float[] zeros;

PShape sineShape;


//======================= INIT WAVES ====================================//
//
//
//
//=====================================================================//

void initWaves()
{
  w = width+16;

  //steps = new int[maxwaves];


  vals1 = new float[w/xspacing];
  vals2 = new float[w/xspacing];
  yvalues = new float[w/xspacing];
}



//======================= CALC / UPDATE ====================================//
//
//
//
//=====================================================================//


int delta_origin=0;
int delta_reflection=0;
int delta_sum = 0;

float dy =0;

void calcWaves() {

  int i;
  float x=theta;
  float period = map(mouseX, 0, width, 2048, 60); //map mouseX position to width of the sine
  dx = (TWO_PI / period) * xspacing;

  half_len = period/2;

  float y = theta2;

  //==============================
  //  update waves
  //==============================
  for (i=0; i < yvalues.length; i++)
  {
    vals1[i] = amplitude * sin(x);
    vals2[i] = amplitude * sin(y);
    yvalues[i] = vals1[i] + vals2[i] ;
    x+=dx;
    y+=dx;
  }



}






//======================= RENDER / DRAW ====================================//
//
//
//
//=====================================================================//

boolean visible1=true;
boolean visible2=true;
boolean visible3=true;



final int SINE_WEIGHT = 8;

void renderWaves() {
  // A simple way to draw the wave with an ellipse at each location

  noStroke();
  ellipseMode(CENTER);
  for (int x = 0; x < yvalues.length; x++) {

    //
    //    if (visible3)
    //    {
    //      if (yvalues[x] < 0.5 && yvalues[x] > -0.5)
    //      {
    //        fill(255, 255, 255);
    //        ellipse(x*xspacing, TUBEY+yvalues[x], 10, 10);
    //      } else  
    //      {
    //
    //      }
    //    }  



    //    if (visible1)
    //    {
    //      fill(ORIGINAL_COLOR);
    //      ellipse(x*xspacing, TUBEY+vals1[x], SINE_WEIGHT, SINE_WEIGHT);
    //    }  
    //
    //    if (visible2)
    //    {
    //      //stroke(255);
    //      fill(GREEN);
    //      ellipse(x*xspacing, TUBEY+vals2[x], SINE_WEIGHT, SINE_WEIGHT);
    //    }
    //    if (x<=delta_origin)
    //    {
    //      fill(255, 0, 0, map(x, delta_origin-255, delta_origin, 0, 255));
    //      ellipse(x*xspacing, TUBEY+vals1[x], SINE_WEIGHT*2.5, SINE_WEIGHT*2.5);
    //    }
    //    if (x<=delta_reflection)
    //    {
    //      fill(255, 255, 0, map(x, delta_reflection-255, delta_reflection, 0, 255));
    //      ellipse(width-x*xspacing, TUBEY+vals2[x], SINE_WEIGHT*2.5, SINE_WEIGHT*2.5);
    //    }
  }

  float pos1=0;
  float pos2=0;

  for (int x=0;x<delta_origin;x++)
  {
    if (x>vals1.length-1)break;
    fill(240, 30, 30, map(x, delta_origin-255, delta_origin, 0, 255));
    pos1=x*xspacing;

    ellipse(pos1, TUBEY+vals1[x], SINE_WEIGHT, SINE_WEIGHT);

    if (x>vals2.length-1)break;
    fill(255, 255, 0, map(x, delta_reflection-255, delta_reflection, 0, 255));
    pos2=width-x*xspacing;
    ellipse(pos2, TUBEY+vals2[x], SINE_WEIGHT, SINE_WEIGHT);

    if (pos1-pos2 >=0)
    {
      //to the right
      fill(0, 255, 0, map(width-pos1, delta_origin*1.5-255, delta_origin*1.5, 0, 255));
      ellipse(pos1, TUBEY+yvalues[x], SINE_WEIGHT, SINE_WEIGHT);

      //to the left
      fill(0, 255, 0, map(pos2, delta_origin*1.5-255, delta_origin*1.5, 0, 255));
      ellipse(pos2, TUBEY+yvalues[x], SINE_WEIGHT, SINE_WEIGHT);
    }
  }

  println(pos1+"     "+pos2+"    "+(pos2-pos1));



  if (delta_origin >= vals1.length*2)delta_origin=0;
  else delta_origin+=2;

  if (delta_reflection >= vals2.length*2)delta_reflection=0;
  else delta_reflection+=2;


  if (delta_sum >= yvalues.length*2)delta_sum=0;
  else delta_sum+=2;
}

