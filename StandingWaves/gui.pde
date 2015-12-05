//===================== GUI OBJECTS ===============================//
//
//
//
//=====================================================================//

PFont myFont;
PFont bigFont;

//rename to different color
final color ORANGE= color(255, 255, 255);


//rename to gray
final color GREEN = color(180, 180, 180);

final int TUBEX = 5;
final int TUBEY = 300;
final int TUBEH = 110;

final int PADDING_KLEFT = 10;
final int SPACE = 10;

//===================== INIT GUI OBJECTS ===============================//
//
//
//
//=====================================================================//


void initGui()
{
  myFont = createFont("Verdana", 60);
  bigFont = createFont("Verdana", 32);
  textFont(bigFont);
}


//===================== DRAW GUI OBJECTS ===============================//
//
//
//
//=====================================================================//


void drawGui()
{

  //drawTube();


  drawVars();
  //drawLabels();

  if (!play)drawSineLabels();
  //drawEquations();
}

void drawSineLabels()
{
  //textFont(myFont);
  stroke(100);
  line(0,TUBEY,width,TUBEY);
  fill(100);
  text("x", 5, TUBEY+35);
  
  
  
  if(visible2)
  {
    fill(GREEN);
    text("Reflection g(x-t)", 15, height/3);
  }
  
  if(visible1)
  {
    fill(ORIGINAL_COLOR);
    text("Original f(x+t)", width/1.75, height/3);
  }
  
  if (visible3)
  {
    fill(SUM_COLOR);
    text("Sum f+g", width/2, height/1.25);
  }

  
  if(update)
  {
    fill(255,200,0);
    text("Particles", 50, height-80);
  }
  //textFont(bigFont);
}

void drawVars()
{
  fill(255);
  textFont(myFont);
  text(Integer.toString((int)frequency)+ " Hz", width - 60*4, 70);
  textFont(bigFont);
  //text("L= "+Float.toString(lambda)+ " m", width/1.25 + 100, 55);
}


void drawEquations()
{
  fill(ORIGINAL_COLOR);
  text("y1 = amp*sin(kx-wt)", 5, height/1.125+ 50);

  fill(REF_COL);
  text("y2 = amp*sin(kx+wt)", 5, height/1.125 + 70);

  fill(SUM_COLOR);
  text("y3 = y1 + y2", 5, height/2 + 90);
}

void drawTube()
{
  fill(0);
  stroke(255);
  rect(0-TUBEX, TUBEY, width+TUBEX, 110);

  //draw text
  textAlign(LEFT, CENTER);
  fill(ORANGE);
  text("TUBE Placeholder", width/2-50, 150);
}


void resetGui()
{
  play      =  false;
  update    =  true;
  visible1  =  true;
  visible2  =  true;
  visible3  =  true;
}




void drawLabels()
{

  //play label
  if (!play)fill(100, 100, 100);
  else fill(ORANGE);
  //rect(PADDING_KLEFT,5,25,3);
  text("play", PADDING_KLEFT, 40);


  //update label
  if (!update)fill(100, 100, 100);
  else fill(ORANGE);
  text("particles", PADDING_KLEFT+110, 40);

  //original label
  if (!visible1)fill(100, 100, 100);
  else fill(ORANGE);
  text("original", PADDING_KLEFT+270, 40);


  //refelction label
  if (!visible2)fill(100, 100, 100);
  else fill(ORANGE);
  text("reflection", PADDING_KLEFT+405, 40);


  //sum label
  if (!visible3)fill(100, 100, 100);
  else fill(ORANGE);
  text("sum", PADDING_KLEFT+585, 40);



  fill(ORANGE);
}



