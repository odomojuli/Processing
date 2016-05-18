float scale, waveIncr, waveVal, sum, 
  sumDecimalPart, pX, pY, speed, h;
int sumIntPart, numWaves ;

void setup() {
  size(2048,2048);
  //size(800,800);
  colorMode(HSB);
  scale = 0.032;
  waveIncr = 1.0;
  h = 255;
  smooth(8);
  noLoop();
}

void draw() {
  speed += 0.00;
  numWaves = 2;

  for (int x = 0; x < height; x++) {
    for (int y = 0; y < width; y++) {
      waveVal = sum = 0;
      for (int i = 0; i < numWaves; i++) {
        float g = atan(tan(sin(waveVal)*(x*scale)+cos(waveVal)*(y*scale))+speed);
        sum += dist((sin(g*g)),cos(g),mag(sin(sin(g*g)),cos(g*g)),atan(mag(atan(g*g),sin(g*g))));
        waveVal += (waveIncr);
      }
      sumIntPart = ceil(sum);
      sumDecimalPart = sum - sumIntPart;
      if (sumIntPart % 2 == 0) sum = sumDecimalPart;
      else sum = 3.0 - sumDecimalPart;
      set(x, y, color(sum*h));
    }
  }
}
void keyPressed() {
  if (key == 's')
  {
    saveFrame("data/#.png");
    exit();
  }
}