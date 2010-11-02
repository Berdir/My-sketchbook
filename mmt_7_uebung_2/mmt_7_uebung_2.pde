PImage img;
void setup() {
  // draw() wird nur einmal aufgerufen
  noLoop();
  img = loadImage("lincoln.png");
    
  size(img.width * 3, img.height + 50);
}

void draw() {
  image(img, 0, 0);
  
  PFont sans = loadFont("FreeSans-18.vlw");
  textFont(sans, 18);
  
  fill(0);
  text("Original", 10, img.height + 20);
  text("First value", img.width + 10, img.height + 20);
  text("Mean", img.width * 2 + 10, img.height + 20);
  
  noStroke();
  
  // Simple method.
  int steps = 10;  
  for (int x = 0; x < img.width; x+= steps) {
    for (int y = 0; y < img.height; y+= steps) {
      fill(get(x, y));
      rect(x + img.width, y, steps, steps);
    }
  }
  
  for (int x = 0; x < img.width; x += steps) {
    for (int y = 0; y < img.height; y += steps) {
      // Calculate mean of different colors of 10x10 block.
      float mr = 0, mg = 0, mb = 0;
      for (int ix = 0; ix < steps; ix++) {
        for (int iy = 0; iy < steps; iy++) {
          mb += get(x + ix , y + iy) & 0xFF;
          mg += get(x + ix , y + iy) >> 8 & 0xFF;
          mr += get(x + ix , y + iy) >> 16 & 0xFF;
        }
      }
      
      // Calculate mean color and create rectangle
      color mean = color((int)(mr / (steps * steps)), (int)(mg / (steps * steps)), (int)(mb / (steps * steps)));
      fill(mean);
      rect(x + img.width * 2, y, steps, steps);
    }
  }
}

