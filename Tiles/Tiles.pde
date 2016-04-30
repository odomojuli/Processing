
boolean savePDF = false;


int tileCount = 25;
int rectSize = 25;

int actRandomSeed = 0;


void setup() {
  size(600, 600);
}



void draw() {

  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  smooth();
  noStroke();
  frameRate(1);


  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      fill(random(255), random(255));

      int posX = width/tileCount * gridX;
      int posY = height/tileCount * gridY;

      float shiftX1 = mouseX/tileCount * random(-1, 1);
      float shiftY1 = mouseY/tileCount * random(-1, 1);
      float shiftX2 = mouseX/tileCount * random(-1, 1);
      float shiftY2 = mouseY/tileCount * random(-1, 1);
      float shiftX3 = mouseX/tileCount * random(-1, 1);
      float shiftY3 = mouseY/tileCount * random(-1, 1);
      float shiftX4 = mouseX/tileCount * random(-1, 1);
      float shiftY4 = mouseY/tileCount * random(-1, 1);

      beginShape();
      vertex(posX+shiftX1, posY+shiftY1);
      vertex(posX+rectSize+shiftX2, posY+shiftY2);
      vertex(posX+rectSize+shiftX3, posY+rectSize+shiftY3);
      vertex(posX+shiftX4, posY+rectSize+shiftY4);
      endShape(CLOSE);
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void mousePressed() {
  noLoop();
}