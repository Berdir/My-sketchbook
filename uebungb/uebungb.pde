void setup() {
  size(400, 400);
  background(100);
  smooth();
}

int currentX = 0;
int currentY = 0;
int targetX = 0;
int targetY = 0;
boolean clear = false;
void mouseReleased() {
  if (currentX > 0) {
    targetX = mouseX;
    targetY = mouseY;
  }
  else {
    currentX = mouseX;
    currentY = mouseY;
  }
}

void keyPressed() {
  if (key == 127) {
    clear = true;
  }
  else if (key == 114) {
    stroke(255, 0, 0);
  }
  else if (key == 98) {
    stroke(0, 0, 255);
  }
  else if (key == 103) {
    stroke(0, 255, 0);
  }
}

void draw() {
  
  if (clear) {
    currentX = currentY = targetX = targetY = 0;
    background(100);
    clear = false;
  }
  
  if (targetX > 0) {
    line(currentX, currentY, targetX, targetY);
    currentX = targetX;
    currentY = targetY;
  }
}
