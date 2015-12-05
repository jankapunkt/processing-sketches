//===================== PARTICLE OBJECTS ===============================//
//
//  Particle Systems are part of the processing learning framework.
//  
//
//=====================================================================//

ParticleSystem ps;

final float GRAVITY = 3.0;

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
  ps = new ParticleSystem(100, width/2, height/2);
}

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

  //spawn-point
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
    pshape.tint(255, 200, 100, 255);
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

  void update()
  {
    //when dead
    if (lifeTime<0)respawn();
    
    velocity.y += GRAVITY * random(-1,1) ;//* distortion;
    velocity.x += GRAVITY * random (-1,1);//* distortion;
    
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
    lifeTime = random(50, 200);

    float newy = 0.8*sin(angle);
    //if (newy>0)newy=newy*-1;
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

  public ParticleSystem(int num_particles, float origin_x, float origin_y)
  {
    particles = new ArrayList<Particle>();

    for (int i=0;i<num_particles;i++)
    {

      Particle p = new Particle(origin_x, origin_y, 8);
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
      p.update();
      p.display();
    }
  }
}

