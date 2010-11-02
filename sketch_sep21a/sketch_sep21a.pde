void setup() {
  size(1024, 768);
  smooth();
}

void draw() {
  if (mousePressed) {
    background(255, 0, 0);
  } else {
    background(100);
    fill(100);
    ellipse(mouseX, mouseY, 80, 80);
    ellipse(mouseX, mouseY, 50, 50);
    ellipse(mouseX, mouseY, 20, 20);
  
    line(0, mouseY, 1024, mouseY);
    line(mouseX, 0, mouseX, 768);
  }
}
