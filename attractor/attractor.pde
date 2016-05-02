float A = 1.4, 
  B = 1.5, 
  C = random(-2, 2), 
  D = -2.05;

// Computes next X coordinate of attractor
float dejongX(float x, float y) {
  return sin(A * y) - cos(B * x);
}

// Computes next Y coordinate of attractor
float dejongY(float x, float y) {
  return sin(C * x) - cos(D * y);
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

void setup() {
  smooth(8);
  size(2048, 2048);
  background(0);
}

void attractor()
{
  float x = random(-10, 10);
  float y = random(-10, 10);
  for (int i = 0; i < 1000; i++) {
    // first compute X & Y for next iteration
    float xx = dejongX(x, y);
    float yy = dejongY(x, y);
    // calculate distance from center/origin
    float d = 1 + sqrt(xx * xx + yy * yy);
    // scale dist exponentially
    d = pow(d, 2);
    // map xx & yy to screen coordinates
    float sx = xx  * width * 0.30 + width/2;
    float sy = yy  * height * 0.30 + height/2;
    // draw dot with alpha/transparency
    // modulate size based on distance (Depth of Field effect)
    fill(255, 4);
    stroke(255,4);
    strokeWeight(16);
    ellipse(sx, sy, d, d);
    // propagate results to next iteration
    x = xx;
    y = yy;
  }
}
void draw() {
  attractor();
  attractor();
  attractor();
  attractor();
  attractor();
}