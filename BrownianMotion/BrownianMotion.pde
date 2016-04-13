int NUM_PARTICLES = 10000;
int amp = 10;
ParticleSystem p;

void keyPressed() { 
  if (key == 's') {
    saveFrame("2048.png");
  }
}
void setup()
{
  smooth(8);
  size(2048, 2048);
  background(0);
  p = new ParticleSystem();
}
void draw()
{
  println(frameCount);
  fill(0,5);
  noStroke();
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
    velocity.x = amp*(noise(int(random(-1,1))*random(width)+position.y)-0.50);
    velocity.y = amp*(noise(int(random(-1,1))*random(height)+position.x)-0.50);
    position.add(velocity);

    if (position.x < 0)position.x += width;
    if (position.x > width)position.x -= width;
    if (position.y < 0)position.y += height;
    if (position.y > height)position.y -= height;
  }

  void render()
  {
    rectMode(CORNERS);
    stroke(random(255),255);
    strokeWeight(random(10));
    line(position.x, position.y, position.x-velocity.x, position.y-velocity.y);
  }
}

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