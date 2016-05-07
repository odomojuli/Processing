
float sX = 256;
float sY = 512;
float x = 512;
float y = 512;

void setup() {
  size(2048, 2048);
  background(255);

  smooth(8);
  frameRate(2400);
}

void draw() {
  if (frameCount % 500 == 0) {
    rect(0, 0, width, height);
    fill(255, 2);
  }

  flower();

  x += sX;
  y += sY;
  if (x < 0 || x > width || random(1) < 0.001) {
    sX = -sX;
  }
  if (y < 0 || y > height || random(1) < 0.001) {
    sY = -sY;
  }
}


void flower()
{
  for (float a = 0; a < TWO_PI; a += 0.032) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    float r = random(1024) * pow(noise(atan(a), tan(a), frameCount * 0.01), 4);
    translate(r, r);
    rect(0, 0, r, r, 1/r, r, 1/r, r);
    fill(0, 64);
    stroke(255, 128);
    strokeWeight(16);    
    popMatrix();
  }
}

void keyPressed()
{
  if (key == 's')
  {
    stop();
    saveFrame("####.png");
    exit();
  }
}