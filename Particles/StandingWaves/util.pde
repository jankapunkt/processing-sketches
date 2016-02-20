void mouseReleased()
{
  resetTimer();
  if (mouseButton ==  LEFT) 
  {
    if (play)
    {
      amp=0;
      play=false;
    }
    else {
      amp=1;
      play=true;
    }
  }
  wave.setAmplitude(amp);
}


void keyPressed()
{
  resetTimer();
  switch(key)
  {  
  case '1':
    play=!play;
    break;

  case '3':
    visible1 = !visible1;
    break;

  case '4':
    visible2 = !visible2;
    break;

  case '5':
    visible3 = !visible3;
    break;
  case '2':
    update=!update;
    break;


  case '6':
  case DOWN:
    if (amp>0)
    {
      amp-=0.1;
      wave.setAmplitude(amp);
    }
    break;
  case '7':
  case UP:
    if (amp<1)
    {
      amp+=0.1;  
      wave.setAmplitude(amp);
    }
    break;
  }
}


void updateValues()
{
  //map frequency to x axis
  if (mouseX>0 && mouseX < width)
  {
    frequency = map( mouseX, 0, width, 0, 600 );
    wave.setFrequency( frequency );
  }
  if (!playSound)wave.setAmplitude(0);


  //update sine values
  if (frequency>0)
  {
    lambda = SPEED/frequency;  //get the length in meter
  }
}

PShape getShape(color col, int partSize)
{
  PShape sh = createShape();
  sh.beginShape(QUAD);
  sh.noStroke();
  sh.tint(col);
  sh.texture(sprite);
  sh.normal(0, 0, 1);
  sh.vertex(- partSize/2, - partSize/2, 0, 0);
  sh.vertex( + partSize/2, - partSize/2, sprite.width, 0);
  sh.vertex( + partSize/2, + partSize/2, sprite.width, sprite.height);
  sh.vertex( - partSize/2, + partSize/2, 0, sprite.height);                
  sh.endShape();

  return sh;
}


int timer = 1800;


void countTimer()
{
  if (timer > 0)
    timer--;
}

void resetTimer()
{
  timer=1800;
}

void mouseMoved()
{
  resetTimer();
}

