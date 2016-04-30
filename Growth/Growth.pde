ArrayList<SLZ> slz;
int slzcount = 1000;
boolean onPressed;

void setup() {
  //  frameRate(5);
  size(2048, 2048);
  smooth(8);
  background(0);
  frameRate(2400);

  slz = new ArrayList<SLZ>();
  //for (int i = 0; i < slzcount;i++) {

  //}
}


void draw() {
  for (SLZ zls : slz)
    zls.jimi();
  if (onPressed)
    slz.add(new SLZ(random(width), random(height), 50));
}



class SLZ {
  float x;
  float y;
  //int count;
  float nowcount = 100;
  float speed = 5;
  int direct;

  SLZ(float xpos, float ypos, int diameter) {
    x=xpos;
    y=ypos;
    //count = diameter;
    nowcount = diameter;
    direct = 1;
  }



  void jimi() {
    fill(random(255), random(255));
    strokeWeight(random(1, 2));
    stroke(random(255), random(255));
    x +=random(-speed, speed);
    y +=random( -speed, speed);
    //    if (nowcount == 0)
    //      direct = 1;
    if (nowcount>0)
      //direct = -1;

      //println(nowcount);
      nowcount --;
    //if(nowcount==0) nowcount ++;

    ellipse (x, y, nowcount*2, nowcount*2);
  }
}

void keyPressed()
{
  if (key == 's')
  {
    saveFrame("###.png");
    exit();
  } else if (key == 't')
  {
    onPressed = true;
  } else if (key == 'f')
  {
    onPressed = false;
  }
}