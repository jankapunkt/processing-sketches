PFont point_font;

color currentcolor;
color easy   = color(252, 156, 0);
color medium = color(121, 252, 0);
color harder = color(0, 145, 252);
color hard   = color(155, 0, 252);

void setup()
{
  size(displayWidth, displayHeight, P2D);
  point_font = loadFont("Comfortaa-Bold-48.vlw");
  initParticles();
  currentcolor=easy;
  smooth();
}


void draw()
{
  background(60, 60, 80);
  ps.run();

  switch(points)
  {
   case 10000:
     currentcolor = medium;
   break;
 
   case 25000:
     currentcolor = harder;
   break;
 
   case 50000:
     currentcolor = hard;
   break;
   
   case 100000:
   break;
  }

  stroke(currentcolor);
  fill(0, 0, 0, 0);
  ellipse(mouseX, mouseY, boxsize*2, boxsize*2);

  fill(easy);
  ellipse(displayWidth/2, displayHeight-80, 40, 40);

  fill(easy);
  stroke(0);
  textFont(point_font);
  text("Score: "+Integer.toString(points), 20, displayHeight-100);
  noStroke();
}

