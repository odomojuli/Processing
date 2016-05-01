int spacing = 12;

float meanDiam = 8;
void setup() {
  size(2048, 2048);
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  smooth(8);
  mouseX = width/2;
  mouseY = height/2;
}
void draw() {
  background(0);
  int flipFlop = 1;
  for (float y=spacing/2; y<width; y+=spacing) {
    flipFlop = (flipFlop+1)%2;
    for (float x=spacing*(1-flipFlop*0.5); x<width; x+=spacing) {
      float dx = x-mouseX;
      float dy = y-mouseY;
      float radius = atan2(dy, dx);
      float angle = mag(dy, dx)-frameCount*TWO_PI/40;
      float variation = meanDiam/2*cos(radius*TWO_PI/spacing/4+angle);
      float varried = meanDiam*1.25+variation;
      ellipse(x, y, varried, varried);
    }
  }

}

void keyPressed()
{
  if (key == 's')
  {
    stop();
    saveFrame("###.png");
    exit();
  }
}