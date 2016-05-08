void keyPressed() { 
  if (key == 's') {
    saveFrame("data/###.png");
    exit();
  }
}

void setup()
{
  size (2048, 2048);
  smooth(8);
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + random(a) * radius2;
    float sy = y + random(a) * radius2;
    vertex(sx, sy);
    sx = x + random(a+halfAngle) * radius1;
    sy = y + random(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + random(a) * radius;
    float sy = y + random(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void draw()

{
  background(0);

  for (int x = -100; x < width + 100; x+= width/128)
  {
    for (int y = -100; y < height + 100; y++)
    {
      fill(0, 128);
      strokeWeight(8);
      stroke(255, 128);
      polygon(x, y, width/128, int(random(3,6)));
      y += random (8, 128);
    }
    noLoop();
  }
  //}
  //saveFrame("images/export-"+"-#####.jpeg");
  //if ( frameCount >= 900 ) {
  //      exit();}
}