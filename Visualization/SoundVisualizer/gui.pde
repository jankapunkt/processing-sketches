
PGraphics eqimg;

public void drawEQ()
{
  colorMode(RGB, 255); 
  

  for (int i = 0; i < numberOfLines; i++)
  {
    float value = bands[i];
    float eqw = width/numberOfLines;
    float lastx=(width-(eqw*(numberOfLines-1))-eqw)/2;
    fill(newcol,50,200,200);
    rect(lastx+i*eqw+i,height/2, eqw,-value*(i+1));
    fill(newcol,50,200,100);
    rect(lastx+i*eqw+i,height/2, eqw,value*(i+1));
  }
}




float rad = 0;
float rot = 0;
float newcol = 0;
boolean colup;

public void drawCirc()
{
  rad++;
  rot+=0.1;
  
  newcol=sin(positionx/10)*255;
   
  
  fill(newcol,80,200,120);
  for (int i = 0; i < numberOfLines; i++)
  {
    float value = bands[i];
    if(rad>500)rad=50;
    if(i==0 && value>5)rad += bands[3]*2;
    
    //draw circle of circles
    float angle = i * TWO_PI / numberOfLines;
    float x = width/2  + cos(angle) * rad;
    float y = height/2 + sin(angle) * rad;
    //ellipse(x, y, 20, 20);
    pushMatrix();
      translate(x,y);
      rotate(angle+rot);
      rect(0,0,rad/2.5,rad/2.5);
    popMatrix();
  }
}
