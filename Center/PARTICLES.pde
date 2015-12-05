//===================== PARTICLE OBJECTS ===============================//
//
//  Particle Systems are part of the processing learning framework.
//  
//
//=====================================================================//


float limit=.25f;
float boxsize=40.0f;
int points=0;


ParticleSystem ps;

final float GRAVITY = 0.35;

PImage sprite; 


//===================== init FUNCIONS ===============================//
//
//
//
//=====================================================================//

PImage root_im;

Particle p;
void initParticles()
{
  root_im = loadImage("sprite_b.png");
  ps = new ParticleSystem(900);
  PVector CENTER = new PVector(displayWidth/2, displayHeight); 

  ps.setTarget(CENTER);
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
  PVector spawn;

  PVector origin;
  PVector velocity;

  float opacity;
  float lifeTime;

  //=======================
  // Particle: Constructor
  //=======================

  Particle(float x, float y, int partSize, PImage im)
  {
    opacity = 1.0f;
    lifeTime = 50;
    origin = new PVector(x, y);
    spawn = new PVector(x, y);
    bg = im;
    respawn();
  }

  //===========================
  //  Particle: Update values
  //===========================

  void update(PVector target)
  {
    PVector diff = PVector.sub(target, origin);
    diff.normalize();
    velocity.add(diff);
    velocity.limit(limit);

    origin.add(velocity);
  }

  //===========================
  //  Particle: draw particle
  //===========================
  PImage bg;

  void display()
  {
    pushMatrix();
    translate(origin.x, origin.y);
      tint(currentcolor);
      image(bg, 0,0);
    popMatrix();
  }

  //==============================
  //  Particle: Respawn on origin
  //==============================
  void respawn()
  {
    //lifeTime=random(1, 20);
    
    velocity = new PVector(0, 0);
    origin = new PVector(spawn.x, spawn.y);
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

  public ParticleSystem(int num)
  {
    particles = new ArrayList<Particle>();

    for (int i=0;i<num;i++)
    {
      Particle p = new Particle(random(0, displayWidth), random(-displayHeight/2,0), 20,root_im);
      particles.add(p);
    }
  }

  //===================================================================
  //  ParticleSystem: update according to yvalues of the standing wave
  //===================================================================

  void run()
  {

    for (int i=0;i<particles.size();i++)
    {
      Particle p = particles.get(i);
      if(hit(p))
      {
        p.respawn();
        //collect points
        points++;
        limit+=.00005;
        boxsize-=.001;
      }
      p.update(_target);
      p.display();
    }
  }
  
   boolean hit(Particle p)
  {
    if (mouseX+boxsize < p.origin.x || mouseX-boxsize > p.origin.x+20)return false;
    if (mouseY+boxsize < p.origin.y || mouseY-boxsize > p.origin.y+20)return false;
    return true;
  }

  private PVector _target;
  void setTarget(PVector target)
  {
    _target=target;
  }
}



