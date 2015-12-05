
boolean titledraw;
PImage  offImg;

public void drawOffscreenTitle(String text, String subtext)
{
  title=loadFont("Xolonium-48.vlw");
  offscreen = createGraphics(width, height, P2D);
  offscreen.beginDraw();
    offscreen.fill(255);
    offscreen.textFont(title,48);
    offscreen.textAlign(CENTER,CENTER);
    offscreen.text(text,width/2,height/2);
    offscreen.textFont(title,24);
    offscreen.text(subtext,width/2,height/2+60);
  offscreen.endDraw();
  offImg = offscreen.get(0,0,width,height);
  offImg.filter(BLUR,6);
  titledraw=true;
}


float imscale=1;
boolean imScaleOn;
public void displayBlurImage()
{
  if(imScaleOn)
    imscale+=0.25;
  if(imscale>10)
  {
    imscale=1;
    imScaleOn=false;  
  }
  pushMatrix();
    translate(width/2,height/2);
    scale(imscale);
    image(offImg, 0,0);
    image(offscreen, 0,0);
   popMatrix();
}
