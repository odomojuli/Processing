void setup() {
  size(800,800);
  smooth(8);
}
void keyPressed() {
  if (key == 's') {
    saveFrame("data/###.png");
  } else if (key == 'r') {
    redraw();
  }
}
void draw() {
  background(0);
  // triangles
  float triRadius = random(5, 6);
  int count = 0;
  for (float y = -triRadius*triRadius; y < height + triRadius*triRadius; y += (0.99)*triRadius) {

    for (float x = -triRadius*triRadius; x < width + triRadius*triRadius; x += (0.99)*triRadius) {

      count++;


      if (count % 3 == 0) {
        fill(255, 255);
        stroke(0);
        strokeWeight(random(1, 2));
      } else if (count % 3 == 1) {
        fill(255, 255);
        stroke(255, 0);
        strokeWeight(random(1, 2));
      } else if (count % 3 == 2) {
        fill(255, 255);
        stroke(255);
        strokeWeight(random(1, 2));
      }

      renderTriangle(x, y, triRadius, (triRadius));
      noFill();
      noStroke();
    }
  }
        noLoop();

}

void renderTriangle(float _xCenter, float _yCenter, float _radius, float _angle) {
  float x1, y1, x2, y2, x3, y3;
  x1 = ((random(TWO_PI)+ radians(_angle)) * _radius) + _xCenter;
  y1 = (random(random(TWO_PI) + radians(_angle)) * _radius) + _yCenter;
  x2 = ((random(TWO_PI) + radians(_angle)) * _radius) + _xCenter;
  y2 = ((random(TWO_PI)+ radians(_angle)) * _radius) + _yCenter;
  x3 = ((random(TWO_PI)+ radians(_angle)) * _radius) + _xCenter;
  y3 = ((random(TWO_PI)+ radians(_angle)) * _radius) + _yCenter;

  triangle(x1, y1, x2, y2, x3, y3);
}