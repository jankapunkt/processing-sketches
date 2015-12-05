//===================== PARTICLE OBJECTS ===============================//
//
//  Particle Systems are part of the processing learning framework.
//  
//
//=====================================================================//

ParticleSystem ps;

final float GRAVITY = 0.35;

PImage sprite; 


//===================== init FUNCIONS ===============================//
//
//
//
//=====================================================================//

Particle p;
void initParticles()
{
  sprite = loadImage("sprite_b.png");
  ps = new ParticleSystem(0, height-20, w/xspacing, xspacing);
}


//===================== DRAW PARTICLES ===============================//
//
//
//
//=====================================================================//

void drawParticles()
{
  ps.run();
}


//===================== PARTICLE CLASS ===============================//
//
//
//
//=====================================================================//

class Particle {

  //=======================
  // Particle: Variables
  //=======================

  PShape pshape;

  PVector origin;
  PVector velocity;

  float opacity;
  float lifeTime;

  //=======================
  // Particle: Constructor
  //=======================

  Particle(float x, float y, int partSize)
  {
    opacity = 1.0f;
    lifeTime = 50;

    origin = new PVector(x, y);


    pshape = createShape();
    pshape.beginShape(QUAD);
    pshape.noStroke();
    pshape.tint(255 ,200, 0,  255);
    pshape.texture(sprite);
    pshape.normal(0, 0, 1);
    pshape.vertex(- partSize/2, - partSize/2, 0, 0);
    pshape.vertex( + partSize/2, - partSize/2, sprite.width, 0);
    pshape.vertex( + partSize/2, + partSize/2, sprite.width, sprite.height);
    pshape.vertex( - partSize/2, + partSize/2, 0, sprite.height);                
    pshape.endShape();

    respawn();
  }

  //===========================
  //  Particle: Update values
  //===========================

  void update(float y)
  {
    
    if (lifeTime<0)respawn();
    
    
    if (y<=40 && y >=-40 && play)
    {
      //velocity.y -= grav;
      velocity.y -= GRAVITY;
      
    }
    if(!play)
    {
      //velocity.y += GRAVITY;
    }
    pshape.translate(velocity.x, velocity.y);
    lifeTime--;
  }

  //===========================
  //  Particle: draw particle
  //===========================

  void display()
  {
    shape(pshape);
  }

  //==============================
  //  Particle: Respawn on origin
  //==============================
  void respawn()
  {
    float angle = random(0, TWO_PI);
    //lifeTime=random(1, 20);
    lifeTime = random(1,map(mouseY, 0,height, 0, 30));
    
    float newy = 0.2*sin(angle);
    if (newy>0)newy=newy*-1;
    velocity = new PVector(0.3 * cos(angle), newy);
    pshape.resetMatrix();
    pshape.translate(origin.x, origin.y);
  }
}


//===================== PARTICLE CLASS ===============================//
//
//  Horizontal particle collection, representing sand or cork powder
//  laying on the ground
//
//=====================================================================//

class ParticleSystem {

  //==============================
  //  ParticleSystem: variables
  //==============================

  private ArrayList<Particle> particles;    

  //==============================
  //  ParticleSystem: Constructor
  //==============================
  
  public ParticleSystem(float x, float y, float w, int density)
  {
    particles = new ArrayList<Particle>();

    for (int i=0;i<w;i++)
    {

      Particle p = new Particle(x+i*density, y, 20);
      particles.add(p);
    }
  }

  //===================================================================
  //  ParticleSystem: update according to yvalues of the standing wave
  //===================================================================

  void run()
  {
    
    for (int i=0;i<yvalues.length;i++)
    {
      Particle p = particles.get(i);
      p.update(yvalues[i]);
      p.display();
    }
  }
}


class VortexSystem extends ParticleSystem
{
  public VortexSystem(float x, float y, float w, int density)
  {
   super(x,y,w,density);
  }
  
  void run(){}
}

