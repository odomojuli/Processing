float[] sX, sY, dX, dY;
float d, z;
int n;
color c;
boolean positif;

void setup() {
  size(1600, 1600);
  setS();
  smooth(8);
}

void setS() {
  n  = round(random(1, 20));
  z  = random(0.01, 0.90);
  sX = new float[n];
  sY = new float[n];
  dX = new float[n];
  dY = new float[n];
  for (int i=0; i<n; i++) {
    sX[i] = random(width);
    sY[i] = random(height);
    dX[i] = random(-1, 1);
    dY[i] = random(-1, 1);
  }
}

void draw() {
  for (int i=0; i<n; i++) {
    sX[i]+=dX[i];
    sY[i]+=dY[i];
    if (sX[i]<0||sX[i]>width) {
      dX[i]*=-1;
    }
    if (sY[i]<0||sY[i]>height) {
      dY[i]*=-1;
    }
  }
  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      d       = 0.0;
      positif = true;
      for (int s=0; s<n; s++) {
        if (positif) {
          d += dist(sX[s], sY[s], x, y)*z;
          positif=!positif;
        } else {
          d -= dist(sX[s], sY[s], x, y)*z;
          positif=!positif;
        }
      }
      d = tan(d)/random(log(d*d));
      if (d<0) {
        c = color(0);
      } else {
        c = color(d*255);
      }
      pixels[y*width+x]=c;
    }
  }
  updatePixels();
}

void keyPressed() {
  if (key == 's') saveFrame("###.png");
  if (key == 'r')
  {
    setS();
  }
}