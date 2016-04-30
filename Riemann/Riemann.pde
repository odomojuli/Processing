int max_a = 4;
float mx;
int range = 16;
float mod(float a, float b)
{
  //desmos mod and processing mod act differently.
  //desmos mod always returns a positive value
  return (abs(a % b));
}

float func(float x, float a)
{
  float f;

  //type 1
  f = mod(3, x)*floor(x)-random(a)*sin(a*x);

  //type 2 this counts from a= 8 to 0 to 8
  //max_a = 8;
  //a = max_a - a;
  //f = mod((10*a)/(1+x*x);

  //type 3
  //max_a = 5;
  //f = mod(ceil(a*x)-a*x+floor(a*x);

  //type 4
  //max_a = 5;
  //f = mod(cos(7*x)+a*cos(x)+ceil(abs(a*x));

  //type 5
  //max_a = 8;
  //f = a*ceil(a*tan(0.25*x+1.5*PI));

  return mod(f, 5);
}

void keyPressed()
{
  if ( key == 's')
  {
    updatePixels();
    save("####.png");
  }
}


void setup()
{
  smooth(8);
  noLoop();
  size(2048, 2048);
  colorMode(HSB, 255);
  int w, h;
  float x, a, f, hue;
  loadPixels();
  for (int i = 0; i < pixels.length; i++)
  {
    w = i % width;
    h = int(i / width);

    x = map(w, 0, width, -range, range);

    if (h < height/2)
    {
      a = map(h, 0, height/2, 0, max_a);
    } else
    {
      a = map(h, height/2, height, max_a, 0);
    }

    f = func(x, a);
    hue = map(f, 0, max_a, 0, 255);
    pixels[i] = color(hue);
    //colorized version
    //pixels[i] = color(hue,255,255);
  }
  updatePixels();
  //save("type5c.png");
}