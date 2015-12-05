import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//===================== MINIM OBJECTS ===============================//
//
//
//
//=====================================================================//


Minim minim;
AudioOutput out;
Oscil wave;

float frequency=0;
float amp=0;     
float lambda=0;  //wavelength in meter

//===================== INIT MINIM OBJECTS ===============================//
//
//
//
//=====================================================================//

void initMinim()
{
   //init minim
  minim = new Minim(this);

  //init output
  out=minim.getLineOut(Minim.MONO, 2048);
  
  //sine wave
  frequency=440;
  wave = new Oscil( frequency, 0.5f, Waves.SINE);
  wave.setAmplitude(0);
  wave.patch( out); 
  
}

void resetMinim()
{
  wave.setAmplitude(0);
}

void fadeOut()
{
  wave.setAmplitude(0);
}

boolean fade=false;

void fadeIn()
{
wave.setAmplitude(1);
}


void updateMinim()
{
  //fade = out.getGain()>=100 ? false : true;
}
//===================== DRAW MINIM OBJECTS ===============================//
//
//
//
//=====================================================================//



void drawMinim()
{
  
  //  int count=out.bufferSize();
  //  for(int i=0; i< count-1;i++)
  //  {
  //      stroke(0);
  //     
  //      //line( i, 50  - out.left.get(i)*50,  i+1,50  - out.left.get(i+1)*50 );
  //      float x = map(i,0,count-1,0,width);
  //      //point(x,VIEWPORT_HEIGHT+100  - out.left.get(i)*50);
  //      line( i, VIEWPORT_HEIGHT+100  - out.right.get(i)*50, i+1, 50 - out.right.get(i+1)*50 );
  //  }
  //  
  // draw the waveform of the output
  //int count=out.bufferSize();
  //stroke(0);
  //for (int i = 0; i < count-1; i++)
  //{
  //float x = map(i, 0, count-1, 0, width);
  //line( i, VIEWPORT_Y - out.left.get(i)*VIEWPORT_Y, i+1, VIEWPORT_Y  - out.left.get(i+1)*VIEWPORT_Y );
  //line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  //}
 
}
