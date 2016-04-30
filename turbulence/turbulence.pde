//Noise Stripes
//Turbulence = "shakiness"
float power = 32;  //Turbulence Power
float d = 64; //Turbulence Density
void keyPressed()
{
  if ( key == 's')
  {
  save("###.png");
  exit();
  }
}
void setup()
{
  size(2048,2048);
  smooth(8);
}
void draw()

{
  noStroke();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float total = 0.0;
      for (float i = d; i >+ 1; i = i/2.0) {
        total += (noise(x/d, y/d)) * d;
      }
      float turbulence = 128.0 * total / d;
      float base = (x * 0.45) + (y * 0.45);
      float offset = base + (power * turbulence / 256.0);
      float gray = abs(tan(offset)) * 256.0;
      stroke(gray);
      point(x, y);
    }
  }
}