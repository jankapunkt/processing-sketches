void radial()
{
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;  // g may change
  GL gl = pgl.beginGL();  // always use the GL object returned by beginGL
  
  gl.glTranslatef(width/2, height/2, 0);
  
  
  //DonutKreis erstellen
  gl.glBegin(gl.GL_LINE_LOOP);
  gl.glColor3f(1,0.5,0);

  for(int i=0;i<360;i++)
  {
    float[] PP=givePoint(150, 2.0*PI/360.0 * (float)i);
    gl.glVertex3f(PP[0],PP[1],0);  
  }
  gl.glEnd();
  
  //Nullpunkt auf dem Kreis holen
  float[]Punkt_Kreis=givePoint(150,0);
  
  //DoppelArray zum speichern der Punkte auf dem Kreis
  float[][]EinheitsKreisPunkte = new float[8][3];
  
  //DoppelArray zum Speichern der Normalen
  float[][]Normalen = new float[8][3];

  //schleife für Punkte auf dem Kreis
  for(int i=0;i<EinheitsKreisPunkte.length;i++)
  {
    float[]PointInYZ=givePoint(PunktKreisRadius,(float)i/(float)EinheitsKreisPunkte.length*2.0*PI);
    EinheitsKreisPunkte[i]=new float[]{Punkt_Kreis[0],Punkt_Kreis[1]+PointInYZ[0],PointInYZ[1]};
    EinheitsKreisPunkte[i]=new float[]{0,PointInYZ[0],PointInYZ[1]}; 
  }

  
  //gl.glRotatef(mouseX,0,1,0); 
  gl.glBegin(gl.GL_LINE_LOOP);
  gl.glColor3f(1,0.5,0);
  
  

  for(int i=0;i<360;i++)
  {
    float[] PP=givePoint(20,2.0*PI/360.0 * (float)i);
    gl.glVertex3f(0,PP[1]+Punkt_Kreis[0],PP[0]);  
  }
  gl.glEnd();
 
 

  pgl.endGL();
}
