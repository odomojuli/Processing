float margin = 500;
float base;
float baseStep = 1.0;
float y[];
float gray;
float gStep = 0.1;
//import processing.pdf.*;

void setup(){
  //size(2048, 2048, PDF, "log.pdf");
  size(2048,2048);
  smooth(8);
  frameRate(2400);
  strokeWeight(1);
  background(255);
   
  gray = 0;
  base = 0;
  y = new float[width];
  for(int i = 0; i < width; i++){
    y[i] = 0;
  }
}
 
void draw(){
  beginShape();
  for(int i = 0; i < width; i++){
    curveVertex(i, base + log(log(y[i])));
    fill(255);
    stroke(0);
  }
  endShape();

  for(int i = 0; i < width; i++){
    y[i] += map(random(1), 0, 1,-0.75, 0.75);

  }
   
  base += 1;
  if(base > height){
    saveFrame("###.png");
    exit();
  }
   
  gray += gStep;
  if(gray > 255){
    gStep *= -1;
  } else if(gray < 0){
    gStep *= -1;
  }
 
}