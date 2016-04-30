
ArrayList<Particle> particles;

void keyPressed()
{
  if (key == 's')
  {
    stop();
    saveFrame("####.png");
    exit();
  }
}
void setup() {
  smooth(8);
  size(2048,2048);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < width*2; i++) {
    particles.add(new Particle());
  }

  background(255);
  stroke(0, 16);  
  strokeWeight(6);
  fill(255);
}

void draw() {
  int k = 1;
  for (Particle particle : particles) {
    float radian = map(noise(mouseX + particle.pos.x * 0.01, 
      mouseY + particle.pos.y * 0.01), 0, 1, 0, TWO_PI * k) + random(PI/k);
    particle.update(radian);
    particle.display();
  }
}


class Particle {

  PVector pos, pPos;
  float step;

  Particle() {
    pos = new PVector(random(width), random(height));
    step = map(random(1), 0, 1, 1,8);
  }

  void update(float radian) {
    pPos = pos;
    pos = PVector.add(pos, new PVector(step * cos(radian), step * sin(radian))); 
    if (pos.x < 0 || pos.x >= width || pos.y < 0 || pos.y >= height) {
      pos = new PVector(random(width), random(height));
      pPos = new PVector(pos.x, pos.y);
    }
  }

  void display() {
    rectMode(CORNERS);
    rect(pPos.x, pPos.y, pos.x, pos.y);
  }
}