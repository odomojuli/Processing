int n = 10000;
int maxAge = 50;
int rdodge = 50;
int opacity = 50;
float speed = 1.00;
float zoom = .010;
boolean crayons, soft, dodge = true;

float[][] a = new float[n][2];
int[] age = new int[n];
float w, h, s;
int t, c;


void setup() {
  size(2048, 2048);
  w = width/2;
  h = height/2;
  colorMode(HSB, TWO_PI, 2, 1);
  smooth(8);
  reset();
  frameRate(2400);
}


void draw() {
  // create new particles
  int np = n / maxAge;
  for (int i=-100; i<np && c<n; i++, c++) newParticle(c);
  // draw particle traces
  for (int i=0; i<c; i++) {
    age[i]++;
    float[] p = a[i];
    if (age[i] > maxAge) newParticle(i);
    else {
      float[] f = f(p[0], p[1]);    
      // opacity based on speed (soft mode) or age (hard mode)
      int m = maxAge/2;
      float o = soft ? atan2(f[0], f[1]) * random(1, 100) * opacity : (m - abs(m - age[i])) * opacity/m;
      // hue based on direction
      float h =  atan2(f[0], f[1]) + PI;  
      stroke(h, crayons ? 1 : 0, crayons ? 1 : 0, o);
      // draw line while updating position
      rect(p[0], p[1], p[0] += s*f[0], p[1] += s*f[1]);
      rectMode(CORNERS);
      fill(255, 1);
    }
  }
}

// noise based flow field
float[] f(float x, float y) {
  ;
  return new float[] {
    (noise((t), x * zoom, y * zoom)-.5), 
    (noise((t+1), x * zoom, y * zoom) - .5)
  };
}


void newParticle(int p) {
  if (dodge) {
    // particle inside a circle around the mouse position
    float r = random(rdodge), ang = random(TWO_PI);
    a[p] = new float[] { random(width) + r * cos(ang), random(height) + r *log(ang) };
  } else { 
    // particle anywhere on screen
    a[p] = new float[] { random(width), random(height) };
  }
  age[p] = 0;
}


void reset() {
  background(crayons ? 0 : #ffffff);
  s = speed / zoom;
  c = 0;
}


void keyPressed() {
  switch(key) {
  case 'g':
    saveFrame("###.png");
    exit();
  case 's' : 
    soft = !soft; 
    break;
  case 'd' : 
    dodge = !dodge; 
    break;
  case 'f' : 
    t++; 
    break;
  case 'c' : 
    crayons = !crayons; 
    break;
  case '+' : 
    zoom /= 1.1; 
    break;
  case '-' : 
    zoom *= 1.1; 
    break;
  case ' ' : 
    break;
  default: 
    return;
  }
  reset();
}