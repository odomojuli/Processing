float y = 200;
float amplitude = random (1, 10);
float steps = 1;
float timeSteps = 0.01;
float versatz = 1;
float sw = random (1, 10);
float strokeAlpha;
color bgColor = #FFFFFF;
int margin = 30;

void keyPressed()
{
  if (key == 's')
  {
    saveFrame("###.png");
    exit();
  }
}
boolean doReDraw = true;

void setup ()
{
  size (2048, 2048);
  smooth(8);
  noLoop();
}

void draw ()
{
  if (doReDraw == true)
  {
    background (0);

    y = random (0, 64);

    while (y < height+64)
    {
      setRandomValues ();
      drawFilles();
      drawLines();

      y+= random (32, 64);
    }

    drawMargin();

    doReDraw = false;
  }
}

void setRandomValues ()
{
  noiseSeed ((int) random (1000));

  sw = random (0.5, 2);

  steps = random (sw*2, 6);
  amplitude = random (40, 250);

  timeSteps = random (0.01, 0.05);

  versatz = random (-200, 200);

  strokeAlpha = random(255, 255);
}

void mousePressed ()
{
  doReDraw = true;
}


int time ()
{
  return (year () + month() + day() +hour() + minute () + second ()+frameCount);
}

void drawFilles ()
{
  fill (0);
  noStroke();

  float noiseValue;
  float x = -abs (versatz);
  float time = 0.0;

  beginShape ();

  vertex (-10, height+1);
  while (x < width )
  {
    noiseValue = y - random(noise (time)*amplitude);
    vertex (x, noiseValue);

    x+= steps;
    time += timeSteps;
  }
  vertex (width+10, height+1);
  endShape();
}

void drawLines ()
{
  noFill ();
  strokeWeight (sw);


  float noiseValue;
  float x = -abs (versatz);
  float time = 0.0;

  while (x < width + abs (versatz))
  {
    noiseValue = y - noise (time)*amplitude;
    strokeWeight (random (sw*0.01, sw*1));
    stroke (random (strokeAlpha*0.10, strokeAlpha));

    line (x, noiseValue+3, x + random (versatz*0.9, versatz), noiseValue+3+height);

    x+= steps;
    time += timeSteps;
  }
}


void drawMargin ()
{
  //noStroke();
  //fill ();
  //rect (0, 0, width, margin);
  //rect (0, height, width, -margin);
  //rect (0, 0, margin, height);
  //rect (width, 0, -margin, height);
}