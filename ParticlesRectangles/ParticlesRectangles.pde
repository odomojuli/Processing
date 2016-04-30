class ParticleSystem
{
  Particle[] particles;

  ParticleSystem()
  {
    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i]= new Particle();
    }
  }

  void update()
  {
    for (int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i].update();
    }
  }

  void render()
  {
    for (int i = 0; i < NUM_PARTICLES; i++)
    {
      particles[i].render();
    }
  }
}

int NUM_PARTICLES = width*height;
ParticleSystem p;
void setup()
{
  smooth(8);
  size(2048, 2048);
  background(255);
  p = new ParticleSystem();
}

void draw()
{
  println(frameCount);
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);
  p.update();
  p.render();
}
class Particle
{
  PVector position, velocity;

  Particle()
  {
    position = new PVector(random(width), random(height));
    velocity = new PVector();
  }

  void update()
  {
    velocity.x = random(100)*(noise(position.y/random(1))-0.5);
    velocity.y = random(100)*(noise(position.x/random(1))-0.5);
    position.add(velocity);

    if (position.x<0)position.x+=width;
    if (position.x>width)position.x-=width;
    if (position.y<0)position.y+=height;
    if (position.y>height)position.y-=height;
  }

  void render()
  {
    stroke(0);
    strokeWeight(4);
    fill(255);
    rectMode(CORNERS);
    rect(position.x, position.y, position.x-velocity.x, position.y-velocity.y);
  }
}

void keyPressed()
{
  if ( key == 's')
  {
    saveFrame("###.png");
  }
}