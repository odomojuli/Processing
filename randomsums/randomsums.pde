float scale, waveIncr, waveVal, sum, 
  sumDecimalPart, pX, pY, speed, h;
int sumIntPart, numWaves ;

void setup() {
  size(600,600);
  //size(2048,2048);
  colorMode(HSB);
  scale = 0.0175;
  waveIncr = 10.0;
  h = 255;
  smooth(8);
  noLoop();
}

void draw() {
  speed += 0.1;
    numWaves = 10;

  for (int x = 0; x < height; x++) {
    for (int y = 0; y < width; y++) {
      waveVal = sum = 0;
      for (int i = 0; i < numWaves; i++) {
        float g = (cos(atan(waveVal)*(x*scale)+tan(waveVal)*(y*scale))+speed);
        sum += tan(g);
        waveVal += (waveIncr);
      }
      sumIntPart = ceil(sum);
      sumDecimalPart = sum - sumIntPart;
      if (sumIntPart % 2 == 0) sum = sumDecimalPart;
      else sum = 3.0 - sumDecimalPart;
      set(x,y, color(sum*h));
    }
  }
}
void keyPressed() {
  if (key == 's')
  {
    saveFrame("###.png");
    exit();
  }
}