int step = 8, stepY=16;
float r, ns = 0;
color[] palette = {
  #FFFFFF, 000000
};

void keyPressed()
{
  if (key == 's')
  {
    stop();
    save("###.png");
    exit();
  }
}

void setup() {
  size(2048, 2048);
  smooth(8);
  background(0);
  rectMode(CENTER);
  for (int y=0; y<height+stepY; y +=stepY) {
    ns = random(1000);
    for (int x=0; x<width+step; x +=step) {
      float w = 1.1*step;
      float m = 0+noise(ns/2)*10;
      float h = m*step;
      pushMatrix();
      r = radians(45)-noise(ns)*radians(90);
      translate(x, y);
      rotate(r);
      fill(255);
      stroke(0);
      strokeWeight(4);
      if (random(1)>.5) {
        int f = int(noise(ns)*2);
        fill(palette[f]);
        stroke(255);
      }
      rect(0, 0, w, h);
      popMatrix();
      ns += 1.3;
    }
  }
}

void draw() {
}