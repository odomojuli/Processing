void keyPressed() {
  if (key == 's') {
    saveFrame("data/images/#####.png");
    exit();
  } else if (key == 'r')
  {
    redraw();
    loop();
  }
}


float noiseW, noiseH, noiseT;

void setup() {
  size(2048, 2048);
  smooth(8);   
  noiseW = random(width);
  noiseH = random(height);
  noiseT = random(frameCount);
}

void draw() {
  background(255);
  float t = frameCount * 0.1;
  for (float h = -100; h < height + 100; h += 10) {
    beginShape();
    curveVertex(0, h + getNoise(0, h, t));
    for (float w = -100; w <= width + 100; w += 10) {
      fill(255);
      stroke(0);
      strokeWeight(10);
      curveVertex(w, h + getNoise(w, h, t));
    }
    curveVertex(width, h + getNoise(width, h, t));
    endShape();
    //saveFrame("data/images/#####.png");
  }

}

float getNoise(float w, float h, float t) {
  return map(noise(noiseW + w*0.001, noiseH + h * 0.001,noiseT + t), 0, 1, -255, 255);
}