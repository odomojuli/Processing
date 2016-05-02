
float xstart, xnoise, ystart, ynoise;
void keyPressed()
{
  if (key == 's')
  {
    stop();
    saveFrame("###.png");
    exit();
  }
}

void setup() {
  size(2048, 2048);
  smooth(8);
  background(0);
  xstart=random(255);
  ystart=random(255);
  noLoop();
}
void draw() {
  background(0);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  for (int y=0; y<=height; y+=7) {
    ynoise +=0.1;
    xnoise= xstart;
    for (int x=0; x<=width; x+=7) {
      xnoise+= 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor*radians(1080*4));
  float edgeSize = noiseFactor * 64;
  float val=  + (noiseFactor*128);
  float alph = 128 +  (noiseFactor*128);
  stroke(255,8);
  strokeWeight(32);
  fill(val, val, val, alph);
  rect(0, 0, edgeSize*noiseFactor, edgeSize*noiseFactor);
  popMatrix();
}