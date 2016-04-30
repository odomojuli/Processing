void setup() {
  size(2048, 2048);//in processing this works fine for me at 800x600
  colorMode(RGB, 100);
}
float f = 0;
float z = 0;
void draw() {
  smooth(8);
  fill(0,4);
  noStroke();
  rect(0, 0, width, height);
  noStroke();
  noFill();
  int rows = int(height/8)+ 4;
  int cols = int(width/8) + 4;
  float d = 255;
  for (int j = 0; j < rows; j++) {
    beginShape();
    for (int i = 0; i < cols; i++) {
      float n = map(noise(i/12.0, j/12.0 + log(f), log(z)), 0, 1, -d, d);
      curveVertex(-8 + i*8, -8 + j*8 + n);
    }
    endShape();
  }
  for (int i = 0; i < cols; i++) {
    beginShape();
    for (int j = 0; j < rows; j++) {
      float n = map(noise(i/12.0, j/12.0 + log(f), log(z)), 0, 1, -d, d);
      curveVertex(-8 + i*8 + n, -8 + j*8);
      float c = map(noise((i)/12.0, j/12.0 + log(f), log(z)), 0, 1.0, 0, 255);
      fill(c, 50);
      rect(-8 + i*8 + n, -8 + j*8 + n, 4, 4);
      noFill();
    }
    endShape();
  }
  f += 0.01;
  z += 0.01;
}

void keyPressed() {
  if (key == 's') {
    saveFrame("####.png");
    exit();
  }
}