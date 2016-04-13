void keyPressed() {
  if (key == 's') {
    saveFrame("###.png");
  }
}

void setup() {
  size(2048, 2048);
  noLoop();
  background(255);
  stroke(0);
  strokeWeight(1);
  smooth(8);
  rectMode(CORNERS);
}
void draw()
{

  float step = 16;
  for (float w = -100; w < width+100; w += step) {
    for (float h = -100; h < height+100; h += step) {
      if (random(1) < 0.5) {
        line(w, h, w + step, h + step);
        fill(255);
      } else {
        rect(w + step, h, w, h + step);
        fill(0);
      }
    }
  }
}