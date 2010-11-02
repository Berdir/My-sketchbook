PImage img;
void setup() {
  size(700, 100);
  // draw() wird nur einmal aufgerufen
  noLoop();
  img = loadImage("bild.jpg");
}
void draw() {
  for (int i = 0; i < 7; i++) {
    image(img, i * 100, 0);
  }
  for (int x = 0; x < 100; x = x + 1) {
    for (int y = 0; y < 100; y = y + 1) {
      color col = get(x, y);
      // Hier kommt die Pixelmanipulation hin
      set(x + 100, y, col * 2);
      set(x + 200, y, col / 2);
      set(x + 300, y, col / 2);
      set(x + 400, y, col / 2);
      set(x + 500, y, col / 2);
      set(x + 600, y, col / 2);
      
    }
  }
}

