PImage img;

int mean = 255/2;

void setup() {
  img = loadImage("lincoln.png");
    
  size(350, 250);
  update();
}

void draw() {
  
}

void keyPressed() {
  if (key == '+') {
    mean += 5;
  }
  if (key == '-') {
    mean -= 5;
  }
  if (mean > 255) {
    mean = 0;
  }
  if (mean < 0) {
    mean = 255;
  }
  update();
}

void update() {
  background(255);
  image(img, 0, 0);
  
  PFont sans = loadFont("FreeSans-18.vlw");
  textFont(sans, 18);
  
  fill(0);
  text("Original", 10, img.height + 20);
  text("S/W", img.width + 10, img.height + 20);
  text("Schwellenwert: " + mean + " (press +/- to change)", 10, img.height + 40);
  
  for (int x = 0; x < img.width; x = x + 1) {
    for (int y = 0; y < img.height; y = y + 1) {
        color col = get(x, y);
        int grey = (int)((col >> 16 & 0xFF) * 0.212671 + (255 - col >> 8 & 0xFF) * 0.715160 + (255 - col & 0xFF) * 0.072169);
        set(x + img.width, y, color(grey > mean ? 0 : 255));
    }
  }
}

