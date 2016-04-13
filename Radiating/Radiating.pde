int c = 255;

void setup() {
  size(1600, 1600);
  noStroke();
  loop();
  smooth(8);
  displayDensity(1);
  pixelDensity(2);

}
void keyPressed() { 
  if (key == 'g') {
    saveFrame("###.png");
    exit();
  }
} 

void draw() {
  background(0);
  int nTiles = 10;
  float s = width / (float) nTiles;
  translate(s/2, s/2);

  float ratio = width / nTiles;
  for (int y = 0; y < nTiles; y++) {
    for (int x = 0; x < nTiles; x++) {
      pushMatrix();
      translate(width/2, height/2);
      scale(s / (float) width);
      c = 255;
      float foo = map(x, 0, nTiles, (0), nTiles*nTiles) * ratio;
      float bar = map(y, 0, TWO_PI, -TWO_PI, (TWO_PI));
      cic(width/nTiles, foo, 0, bar);
      popMatrix();
    }
  }
}

void cic(float radius, float rSub, float angle, float aAdd) {
  pushMatrix();
  do {
    fill(c);
    c = 255 - c;
    polygon(0, 0, radius, 5);
    radius -= +(log(log(log(rSub))));
    angle += (aAdd);
    float r = (rSub);
    float x = cos(angle + aAdd) * r;
    float y = sin(angle + aAdd) * r;
    translate(x, y);
  } while (radius >= 1);
  popMatrix();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + tan(a) * radius;
    float sy = y + atan(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}