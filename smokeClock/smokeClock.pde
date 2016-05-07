class Clock
{
  float angle = 0;
  float radius = random(1, 2048);
  float rotSpeed = random(-1, 1);

  float rnoise = random(16, 128);

  float scolor = random(0, 255);
  float colorSpeed = random(0.1, 0.1);
  int cdir = 1;

  int x = 0;
  int y = 0;

  float x2 = 0;
  float y2 = 0;


  public Clock(int cx, int cy)
  {
    x = cx;
    y = cy;
  }

  public void setCenter(float inx, float iny)
  {
    x = int(inx);
    y = int(iny);
  }

  public void tick()
  {
    angle += rotSpeed;

    if (angle > 360)
      angle -= 360;
    else if (angle < 0)
      angle += 360;

    scolor += colorSpeed * cdir;

    if ( scolor >= 255 )
      cdir = -1;
    else if ( scolor <= 125)
      cdir = 1;
  }

  public void display(boolean isDraw)
  {
    float radius2 = 16+radius*noise(angle/100, rnoise);
    x2 = x+radius2*sin(radians(angle));
    y2 = y+radius2*cos(radians(angle));

    //stroke(scolor,40);
    //strokeWeight(1);

    if ( isDraw )
      ellipse(x, y, x2, y2);
    ellipseMode(CORNERS);
    fill(0,4);
    stroke(255, 4);
    strokeWeight(16);
  }
}

Clock[] cs;
int clockNum = 8;

void setup()
{
  smooth(8);
  size( 2048, 2048);
  background(255);
  cs = new Clock[ clockNum ];

  for ( int i=0; i<clockNum; i++ )
  {
    cs[i] = new Clock(width/2, height/2);
  }

  frameRate( 256 );
}

void draw ()
{
  int tickPerFrame =16;
  for (int i=0; i< tickPerFrame; i++)
  {
    for (int c=0; c< clockNum; c++)
    {
      if ( c != 0 )
        cs[c].setCenter(cs[c-1].x2, cs[c-1].y2);

      cs[c].tick();

      if ( c != 0 )
        cs[c].display(true);
      else
        cs[c].display(false);
    }
  }
}

void keyPressed()
{
  if (key == 's')
  {
  stop();
  saveFrame("####.png");
  exit();
}
}