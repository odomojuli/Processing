float noiseX;
float noiseY;
float noiseT;

void setup() {
  size(4096, 4096);
  frameRate(1);
  smooth(8);
  colorMode(HSB);
  noiseX = random(255);
  noiseY = random(255);
  noiseT = random(255);
}

void draw() {
  float z = 0.01;
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float n = noise((noiseX) + x * z, noiseY + y * z, noiseT + frameCount * 0.2);
      float level = int(n * 128);
      float hue = (level * 64) % 255;
      color c = color(hue);
      pixels[y * width + x] = c;
    }
  }
  updatePixels();
}

void keyPressed()
{
  if (key == 's')
  {
    saveFrame("####.png");
    exit();
  }
}