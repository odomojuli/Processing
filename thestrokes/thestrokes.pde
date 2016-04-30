void keyPressed()
{
  if (key == 's'){
  noLoop();
  saveFrame("####.png");
  exit();
  }
}
void setup() {
  size(2048, 2048);
  smooth(8);
  stroke(#FFFFFF);
  background(0);
  noFill();
}
float xstep = 10;
float ystep = 10;
float y = 0;

float nx = random(100);
float ny = random(100);
float nz = random(1000);
void draw() {
  // background(0);
  stroke(#FFFFFF);
  strokeWeight(random(1,2));
  for (float k = -ystep; height+ystep > k; k+=ystep) {
    beginShape();
    curveVertex(0, k);
    for (float l = -xstep; l < width+xstep; l+=xstep) {
      nx = l/234;
      ny = k/165;
      y = map(noise(nx, ny, nz), 0, 1, -100, 100)+k;
      curveVertex(l, y);
    }

    vertex(width, k);
    endShape();
  }
  stroke(#000000);
  strokeWeight(random(1,2));
  for (float j = -ystep; height+ystep > j; j+=ystep) {
    beginShape();
    curveVertex(0, j);
    for (float i = -xstep; i < width+xstep; i+=xstep) {
      nx = i/255;
      ny = j/255;
      y = map(noise(nx, ny, nz), 0, 1, -255, 255)+j;
      curveVertex(i, y);
    }

    curveVertex(width, j);
    endShape();
  }

  nz+=.01;
}