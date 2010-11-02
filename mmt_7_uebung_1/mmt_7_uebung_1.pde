PImage img;
void setup() {
  size(700, 150);
  // draw() wird nur einmal aufgerufen
  noLoop();
  img = loadImage("bild.jpg");
}
void draw() {
  background(255);
  image(img, 0, 0);
  
  PFont sans = loadFont("FreeSans-18.vlw");
  textFont(sans, 18);
  
  fill(0);
  text("Original", 10, 130);
  text("Blau", 110, 130);
  text("Grün", 210, 130);
  text("Rot", 310, 130);
  text("Grau", 410, 130);
  text("SW", 510, 130);
  text("Invert", 610, 130);
  
  
  for (int x = 0; x < 100; x = x + 1) {
    for (int y = 0; y < 100; y = y + 1) {
      color col = get(x, y);
      // Hier kommt die Pixelmanipulation hin
      
      int grey = (int)((col >> 16 & 0xFF) * 0.212671 + (255 - col >> 8 & 0xFF) * 0.715160 + (255 - col & 0xFF) * 0.072169);
      
      set(x + 100, y, color(0, 0, col & 0xFF));
      set(x + 200, y, color(0, col >> 8 & 0xFF, 0));
      set(x + 300, y, color(col >> 16 & 0xFF, 0, 0));
      set(x + 400, y, color(grey));
      set(x + 500, y, color(grey > 140 ? 255 : 0));
      // Y = 0.212671 * R + 0.715160 * G + 0.072169 * B;
      set(x + 600, y, color(255 - col >> 16 & 0xFF, 255 - col >> 8 & 0xFF, 255 - col & 0xFF));
      
    }
  }
}

