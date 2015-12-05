final int numberOfLines= 32;
final int circleSize = 100;


import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer radiohead;
FFT         fft;

float[] bands;
float[] lastValues;

float positionx;

float lineHue, lineColor;

PImage bgimage;
PShader deform, monjori;

PGraphics offscreen;

PFont title;

void setup()
{
  //environment
  size(1280, 520, P2D);
  colorMode (HSB, 360, 100, 100, 100);
  background(0x1a1a1a);
  frameRate(30);
  
  //sound init
  init_minim();

  //particle system
  initParticles();
  
  drawOffscreenTitle("title font", "subtitle font");
  
  
  //global flags
  imageMode(CENTER);
  noStroke();
}


void draw()
{
  //println(frameRate);
  background(0,0,newcol/10);
  
  //get fft values
  calc_bands();
  

  
  
  //draw fx
  drawParticles();
  drawCirc();
  drawEQ();

  //draw offscreen text
  displayBlurImage();
  
  
  
  if(Math.round(positionx)==50)imScaleOn=true;
}

