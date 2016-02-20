ParticleSystem ps;
PImage sprite; 


void setup()
{
  size(600,600,P2D);
  initParticles();  
}


void draw()
{
  background(0);
  drawParticles();
}


void initParticles()
{
  sprite = loadImage("sprite_b.png");
  ps = new ParticleSystem(100, width/2, height/2);
}

void drawParticles()
{
  ps.run();
}



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

  Particle(float x, float y, float partSize)
  {
    opacity = 1.0f;
    lifeTime = 50;

    origin = new PVector(x, y);

    pshape = createShape();
    pshape.beginShape(QUAD);
    pshape.noStroke();
    pshape.tint(255, 255, 255, random(10,255));
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
    
    //velocity.y += GRAVITY * random(-1,1) ;//* distortion;
    //velocity.x += GRAVITY * random (-1,1);//* distortion;
    
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
    
    lifeTime = random(10, 60);
    
    float newy = 0.8*sin(random(0, TWO_PI));
    
    velocity = new PVector();
    pshape.resetMatrix();
    pshape.translate(random(mouseX-50,mouseX+50), random(mouseY-50,mouseY+50));
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

      Particle p = new Particle(origin_x, origin_y, random(1,15));
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