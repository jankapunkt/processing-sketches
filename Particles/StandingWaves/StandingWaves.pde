

//=======================================================================
//
//  setup
//
//=======================================================================


void setup()
{
  size(1200, 600, P3D);
  
  //smooth();
  frameRate(-1);                                      // set unlimited frame rate
   ((PJOGL)PGraphicsOpenGL.pgl).gl.setSwapInterval(1);

  hint(DISABLE_DEPTH_MASK);

  //init the simulation environment

  initMinim();
  initWaves();
  initGui();
  //initParticles();
}

boolean sketchFullScreen() {
  //return true;
  return false;
}

//=======================================================================
//
//  draw
//
//=======================================================================


boolean play = true;
boolean update=true;

boolean playSound=false;

void draw()
{
  //println(frameRate);

  if (timer <= 0)resetApplication();
  countTimer();

  //update before draw
  if (playSound)updateMinim();


  background(0,0,map(mouseY, 0, height, 0, 40));

  //drawGui(); //draw gui always in the back

  if (play)
  {
    float diff = map(mouseY, 0, height, 0, 0.9); //waves should only move when playmode is on
     theta += diff;
     theta2+=diff;
     
  }
  updateValues();
  calcWaves(); //calc waves always

    //if (update)drawParticles();

  renderWaves();
}

float theta2=0.0;

void resetApplication()
{
  println("reset");

  resetGui();
  resetMinim();
}

