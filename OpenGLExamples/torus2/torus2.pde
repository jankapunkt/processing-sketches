import javax.media.opengl.*;
import processing.opengl.*;

float DonutRadius = 150;
float PunktKreisRadius = 50;

void setup() {
  size(400, 400, OPENGL);
}

int radius=50;

void draw()
{
  background(200);
  radial();
}


//wird benötigt um Punkte eines Kreises zu holen, ohne diese Methode kann kein Kreis gezeichnet werden.
float[] givePoint(float radius, float radianangle)
{
    float XX=radius*cos(radianangle);
    float YY=radius*sin(radianangle);
    return new float[]{XX,YY}; 
}


//Wird zum Rotieren der Punkte verwendet benötigt rotateZ
float[][] rotate(float[][] Points, float radian, float[] Mid)
{
 
    float[][] Out=new float[Points.length][3];
    for(int i=0;i<Points.length;i++)
    {
        Out[i]=rotateZ(Points[i],radian, Mid);
    }
    return Out;
    
    
}
    

//Methode zum Rotieren um die ZAchse wird benötigt um auf dem Kreis die Punkte in rotierte Weise anzugeben     
float[] rotateZ(float[] Coords, float rad,float[] MidPoint)
{
  float[] Back=Coords;
  
  Back[0]=(Coords[0]-MidPoint[0])*cos(rad)-(Coords[1]-MidPoint[1])*cos(rad) + MidPoint[0]; 
  Back[1]=(Coords[0]-MidPoint[0])*sin(rad)+(Coords[1]-MidPoint[1])*sin(rad) + MidPoint[1]; 
  
  return Back;
}
