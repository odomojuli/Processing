float theta=0;
int margin = 50;

void keyPressed()
{
  if (key == 's')
  {    
    saveFrame("####.png");
  } else if (key == 'l')
  {
    noLoop();
  } else if (key == 'k')
  {
    loop();
  }
}

void setup() {
  size (800, 800);
  background (255);
}

void draw() {
  background(255); //erases the last one
  strokeWeight(10);

  //for loops to make the grid: makes a spot every 50 pixels,
  //including ones just off each edge, so things looked right
  for (int x = -margin; x < width + margin; x += margin) {
    for (int y = -margin; y < height + margin; y += margin) {
      fill(0);
      theta = radians(45)*int(random(0,4)); //increments the rotation

      //pushMatrix pauses any active transformations going on.
      //Anything between push and pop will apply only to the things
      //between them. After pop, anythign active before push will
      //be applied again. This keeps transformations contained.
      pushMatrix();
      translate(x, y); //moves the "origin" to x,y. see tumblr post
      rotate(theta); //rotates the object by theta.
      rect(0, 0, random(100), random(100)); //CLOSE connects the shape's last two points
      popMatrix();
    }
  }
}