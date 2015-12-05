import javax.media.opengl.*;
import processing.opengl.*;

float a; 
float []midPointx;
float []midpointy;

void setup() {
  size(400, 400, OPENGL);
}
int r=width/2;
void draw() {
  background(255,0,0);
  
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;  // g may change
  GL gl = pgl.beginGL();  // always use the GL object returned by beginGL
  

  gl.glTranslatef(width/2, height/2, 0);
  
  gl.glBegin(gl.GL_POLYGON);
  gl.glColor3f(1,1,0);
  
  for(int i=0;i<5;i++)
  {
  float[] PP=givePoint(200, 2.0*PI/5.0 * (float)i+(float)mouseX/(float)width*PI);
  
  gl.glVertex3f(PP[0],PP[1],0);
  
  }
  gl.glEnd();
  
  float[] AA=givePoint(200, 2.0*PI/5 * (float)1);
  float[] BB=givePoint(200, 2.0*PI/5 * (float)2);
  float[] AB={   ( AA[0]+BB[0] )*0.5,   ( AA[1]+BB[1] ) *0.5 };
  float InkreisRad=dist(0,0,AB[0],AB[1]);

  gl.glBegin(gl.GL_POLYGON);
  gl.glColor3f(0,1,1);

  for(int i=0;i<360;i++)
  {
  float[] PP=givePoint(InkreisRad, 2.0*PI/360.0 * (float)i);
  gl.glVertex3f(PP[0],PP[1],0);
  }

  gl.glEnd(); 
  
  gl.glBegin(gl.GL_POLYGON);
  gl.glColor3f(1,1,0);
  
  for(int i=0;i<5;i++)
  {
  float[] PP=givePoint(InkreisRad, 2.0*PI/5.0 * (float)i+(float)mouseX/(float)width*PI);
  
  gl.glVertex3f(PP[0],PP[1],0);
  
  }
  gl.glEnd();
  
  
  

  gl.glBegin(gl.GL_LINE_LOOP);
  gl.glColor3f(1,0.5,0);

  for(int i=0;i<360;i++)
  {
  float[] PP=givePoint(200, 2.0*PI/360.0 * (float)i);
  gl.glVertex3f(PP[0],PP[1],0);
  }

  gl.glEnd(); 
 
  
  //gl.glRectf(-200, -200, 200, 200);
  pgl.endGL();
  
  //a += 0.9;
}



float[] givePoint(float radius, float radianangle)
{
    float XX=radius*cos(radianangle);
    float YY=radius*sin(radianangle);
    return new float[]{XX,YY}; 

}
