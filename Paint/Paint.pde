
int x, y, i, w=2048;
void setup() {
  size(2048, 2048);
  colorMode(GRAY);
  smooth(8);
  frameRate(2400);

  for (i=0; ++i< width*width; )set(i%width, i/width, -1^r(1<<24));
}
void draw() {
  for (i=0; ++i < width; ) {
    x=y;
    y=r(w);
    set(x+r(3)-1, y+r(3)-1, get(x, y, r(255), r(255)));
  }
}
int r(int a) {
  return int(random(a));
}