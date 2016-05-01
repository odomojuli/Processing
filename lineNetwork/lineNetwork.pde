Pa[] p = new Pa[512];
int limit = 128;
int k = 4;

void keyPressed()
{
  if (key == 's')
  {
    stop();
    save("####.png");
    exit();
  }
}
void setup() {
  for (int i = 0; i<p.length; i++) {
    p[i] = new Pa();
  }
  smooth(16);
  size(2048, 2048);
  background(255);
  noFill();
  //noStroke();
  stroke(0);
  strokeWeight(1);
}

void draw() {
  fill(255, 4);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i<p.length; i++) {
    p[i].show(i);
  }
}

class Pa {
  float x, y, vx, vy;
  public Pa() {
    x = random(width);
    y = random(height);

    float a = random(TWO_PI);
    vx = cos(a)*k;
    vy = sin(a)*k;
  }

  void show(int index) {
    x+=vx;
    y+= vy;
    for (int i = index+1; i<p.length; i++) {
      float d = dist(x, y, p[i].x, p[i].y);
      if (d<limit) {
        //noStroke();
        stroke(0, map(d, limit/2, limit, 0, 255));
        line(x, y, p[i].x, p[i].y);
        fill(0, 8);
        rectMode(CORNERS);
      }
    }
    x = lm(x, width);
    y = lm(y, width);
  }
}
float lm(float a, float b) {
  if (a<0) {
    return a+b;
  }
  if (a>b) {
    return a-b;
  }
  return a;
}