import processing.opengl.*;

float rotx = 0;
float roty = 0;

float h = 20;
float w;
float hspeed = 0;
float wspeed = 0;
float g = 0.1;
float rstep = 0.05;
int lh;


  PImage eins;
  PImage zwei;
  PImage drei;
  PImage vier;
  PImage fuenf;
  PImage sechs;

PFont font;

void setup() {
  size(300, 400, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  lh = height - 20;
  w = width / 2.0;
  h = height - 60;

  eins = loadImage("eins.jpg");
  zwei = loadImage("zwei.jpg");
  drei = loadImage("drei.jpg");
  vier = loadImage("vier.jpg");
  fuenf = loadImage("fünf.jpg");
  sechs = loadImage("sechs.jpg");

  font = loadFont("AndaleMono-16.vlw");
}

void reset() {
}

void mouseClicked() {
 if (mouseButton == LEFT) {
   rotx += HALF_PI;
 }
 else {
   roty += HALF_PI;
 }
}

void draw() {
  background(0);
  lights();
  fill(200);
  noStroke();
  rect(0, lh, width, height);

  fill(255);
  
  textFont(font);
  text("X Rotation: " + rotx, 10, 120);
  text("Y Rotation: " + roty, 10, 135);
  
  int sidex = (int)((rotx / HALF_PI) % 4);
  int sidey = (int)((roty / HALF_PI) % 4);
  
  
  text("X Side: " + sidex, 10, 20);
  text("Y Side: " + sidey, 10, 35);
  
  
  
  translate(w, h, -100);
  rotateX(rotx);
  rotateY(roty);
  
  beginShape(QUADS);
  // Front
  texture(eins);
  vertex(-50, -50, 50, 0, 0);
  vertex(-50, 50, 50, 0, 200);
  vertex(50, 50, 50, 200, 200);
  vertex(50, -50, 50, 200, 0);
  
  endShape();
  beginShape(QUADS);
  
  // Back
  texture(sechs);
  vertex(-50, -50, -50, 0, 0);
  vertex(-50, 50, -50, 0, 200);
  vertex(50, 50, -50, 200, 200);
  vertex(50, -50, -50, 200, 0);
  
  endShape();
  beginShape(QUADS);
  
  // Top
  texture(drei);
  vertex(-50, -50, 50, 0, 0);
  vertex(-50, -50, -50, 0, 200);
  vertex(-50, 50, -50, 200, 200);
  vertex(-50, 50, 50, 200, 0);
  
  endShape();
  beginShape(QUADS);
  
  // Left
  texture(zwei);
  vertex(-50, -50, 50, 0, 0);
  vertex(-50, -50, -50, 0, 200);
  vertex(50, -50, -50, 200, 200);
  vertex(50, -50, 50, 200, 0);
  
  endShape();
  beginShape(QUADS);
  
  // Right
  texture(fuenf);
  vertex(-50, 50, 50, 0, 0);
  vertex(-50, 50, -50, 0, 200);
  vertex(50, 50, -50, 200, 200);
  vertex(50, 50, 50, 200, 0);
  
  endShape();
  beginShape(QUADS);
  
  // Bottom
  texture(vier);
  vertex(50, -50, 50, 0, 0);
  vertex(50, -50, -50, 0, 200);
  vertex(50, 50, -50, 200, 200);
  vertex(50, 50, 50, 200, 0);
  
  endShape();  
}


