
void keyPressed() {
  if (key == 's') {
    saveFrame("images/image.jpg");
    exit();
  }
}

float noiseW, noiseH, noiseT;

void setup() {
  size(2048, 2048);
  smooth(1);

  stroke(255, 255);
  strokeWeight(4);
  //noFill();
  noFill();
  noiseW = random(64);
  noiseH = random(128);
  noiseT = random(256);
  noLoop();
}

void draw() {
  background(0);
  float t = frameCount * 0.01;
  for (float h = -200; h < height + 200; h += 8) {
    beginShape();
    for (float w = -200; w <= width + 200; w += 16) {
      curveVertex(w, h + getNoise(w, h, t));
    }
    endShape();
  }
}

float getNoise(float w, float h, float t) {
  return map(noise(noiseW + w* 0.1, noiseH + h * 0.01, noiseT + t), 0, 1, -100, 100);
}