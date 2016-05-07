
void keyPressed() {
  if (key == 's') {
    saveFrame("images/###.png");
    exit();
  }
}

float noiseW, noiseH, noiseT;

void setup() {
  size(2048, 2048);
  smooth(8);

  stroke(255, 128);
  strokeWeight(8);
  //noFill();
  noiseW = random(64);
  noiseH = random(128);
  noiseT = random(256);
  loop();
}

void draw() {
  background(0);
  float t = frameCount * 0.1;
  for (float h = -200; h < height + 200; h += 8) {
    beginShape();
    for (float w = -200; w <= width + 200; w += 16) {
      curveVertex(w, h + getNoise(w, h, t));
    }
    endShape();
    fill(255,128);

  }
}

float getNoise(float w, float h, float t) {
  return map(noise(noiseW + w* 0.01, noiseH + h * 0.01, noiseT + t), 0, 1, -100, 100);
}