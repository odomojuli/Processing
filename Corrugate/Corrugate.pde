float colorLevel, amp, frequencyX, frequencyY, paint, diagonal;
boolean toggleLoop = true;

void setup() {
  size(2048,2048);
  colorLevel = 255;
  colorMode(HSB, colorLevel); 
  amp = colorLevel / 2;      // See notes.
  frequencyX = 0.125;          // Smaller values make larger corrugations.
  frequencyY = 100.0;          // Play with different frequency ratios.
  diagonal = 0.0; 
  smooth(8);// For loop values may need to be adjusted when using.
}

void draw() {
  for (int y = -200; y < height + 200; y++) {           
    for (int x = -200; x < width + 200; x++) {
      paint = ((sin(x * frequencyX) + random(0,1)) * amp) +
        ((sin(y * frequencyY) + random(0,1)) * amp);
      //      set(x + int(y * diagonal), y, color(paint));    // Grayscale.
      set(x + int(y * diagonal), y, color(paint, colorLevel));  // HSB.
    }
  }
  //  frequencyY += 0.005;                              // Slow, but edifying.
  noLoop();
}

/* ========================== UI ========================== */

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) {
      noLoop();
      cursor();
      toggleLoop = false;
    } else {
      loop();
      toggleLoop = true;
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("#####.png");
    exit();
  }
}