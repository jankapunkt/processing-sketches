import javax.media.opengl.*;
import processing.opengl.*;

float a; 
int radius = 50;
float[] mittelPunkt = {0,0,0};
float[] mittelPunkt2 = {0,0,0};

void setup() {
  size(800, 600, OPENGL);
}

void draw() {
  background(255);
  fahrrad();

  
}



void fahrrad()
{
    
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;  // g may change
  GL gl = pgl.beginGL();  // always use the GL object returned by beginGL
  
  gl.glColor4f(0.7, 0.7, 0.7, 0.8);
  gl.glTranslatef(width/2+mouseX/2, height/2, 0);
  
  
  /// Rad vorne Zeichnen
  /// mittelpunkt wird an mittelPunkt[] übergeben
  gl.glTranslatef((float)-radius*3,(float)radius,0.0);
  gl.glBegin(gl.GL_LINE_LOOP);
  gl.glColor3f(0,1,1);
  
  
  for(int i=0;i<360;i++)
  {   
    float[] PPP=givePoint(radius, 2.0*PI/360.0 * (float)i);
    gl.glVertex3f(PPP[0],PPP[1],0); 
  }
  for(int i=0;i<360;i++)
  {  
    if(i==90)
    {
      float[] PP = givePoint(radius,2.0*PI/360.0 * (float)i*2);
        mittelPunkt[0]=PP[0];
        mittelPunkt[1]=PP[1];
        gl.glBegin(gl.GL_LINES);
        gl.glColor3f(0,1,1);
        gl.glVertex3f(PP[0],PP[1],0);
        gl.glEnd();         
    }
  
  }
  gl.glEnd();
  
  
  /// Rad hinten Zeichnen
  /// mittelpunkt wird an mittelPunkt[] übergeben
  gl.glTranslatef((float)radius*4,0.0,0.0);
  gl.glBegin(gl.GL_LINE_LOOP);
  gl.glColor3f(0,1,1);
  
  
  for(int i=0;i<360;i++)
  {   
    float[] PPP=givePoint(radius, 2.0*PI/360.0 * (float)i);
    gl.glVertex3f(PPP[0],PPP[1],0); 
  }
  for(int i=0;i<360;i++)
  {  
    if(i==90)
    {
      float[] PP = givePoint(radius,2.0*PI/360.0 * (float)i*2);
        mittelPunkt2[0]=PP[0];
        mittelPunkt2[1]=PP[1];
        gl.glBegin(gl.GL_LINES);
        gl.glColor3f(0,1,1);
        gl.glVertex3f(PP[0],PP[1],0);
        gl.glEnd();         
    }
  
  }
  gl.glEnd();
  
  

  pgl.endGL();
}


float[] givePoint(float radius, float radianangle)
{
    float XX=radius*cos(radianangle);
    float YY=radius*sin(radianangle);
    return new float[]{XX,YY}; 
}
