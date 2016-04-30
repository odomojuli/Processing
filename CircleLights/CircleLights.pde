int maxCount = 12800; //max count of the cirlces
int fc, currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; // radius
PVector[] pos = new PVector[maxCount];
float theta;
boolean save = false;

void setup() {
  size(2048, 2048);
  rectMode(CENTER);
  smooth(8);
  noLoop();
  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 10;
  pos[0]= new PVector(x[0], y[0]);

  createPos();
}


void draw() {
  background(#000000);

  float offSet = TWO_PI/pos.length;

  for (int i=0; i<pos.length; i++) {
    float scal = map(sin(theta+(offSet*i)*2), -1, 1, 1, 2);
    fill(255, 64);
    noStroke();
    ellipse(pos[i].x, pos[i].y, r[i]*scal*2, r[i]*scal*2);
  }

  for (int i=0; i<pos.length; i++) {
    float scal = map(sin(theta+(offSet*i)*2), -1, 1, 1, 2);
    fill(255, 128);
    //noStroke();
    ellipse(pos[i].x, pos[i].y, r[i]*scal, r[i]*scal);
  }

  for (int i=0; i<pos.length; i++) {
    float scal = map(sin(theta+(offSet*i)*2), -1, 1, 1, 2);
    fill(255, 192);
    //noStroke();
    ellipse(pos[i].x, pos[i].y, r[i]*scal*.5, r[i]*scal*.5);
  }


  theta += 0.0523;

  if (save) {
    if (frameCount%4==0 && frameCount<fc + 121) saveFrame("image-####.gif");
  }
}

void createPos() {

  for (int j=0; j<maxCount-1; j++) {
    float newR = random(5, 20);
    float newX = random(0+newR, width-newR);
    float newY = random(0+newR, height-newR);

    float closestDist = 100000000;
    int closestIndex = 0;
    // which circle is the closest?
    for (int i=0; i < currentCount; i++) {
      float newDist = dist(newX, newY, x[i], y[i]);
      if (newDist < closestDist) {
        closestDist = newDist;
        closestIndex = i;
      }
    }

    // aline it to the closest circle outline
    float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

    x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
    y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
    r[currentCount] = newR;
    pos[currentCount] = new PVector(x[currentCount], y[currentCount]);
    currentCount++;
  }
}

void mouseReleased() {
  currentCount=1;
  createPos();
}

void keyPressed() {
  fc = frameCount;
  save = true;
  if (key == 's')
  {
    saveFrame("###.png");
    exit();
  }
}