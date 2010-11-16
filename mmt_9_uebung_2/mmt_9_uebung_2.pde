import processing.opengl.*;

float rotx = PI/4;
float roty = PI/4;

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
  size(500, 800, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  lh = height - 20;
  w = width / 2.0;

  eins = loadImage("eins.jpg");
  zwei = loadImage("zwei.jpg");
  drei = loadImage("drei.jpg");
  vier = loadImage("vier.jpg");
  fuenf = loadImage("fünf.jpg");
  sechs = loadImage("sechs.jpg");

  font = loadFont("AndaleMono-16.vlw");
}

void reset() {
  h = mouseY - 50;
  w = mouseX - 50;
  loop();
}

void mousePressed() {
 reset();
}

void draw() {
  background(0);
  lights();
  fill(200);
  noStroke();
  rect(0, lh, width, height);

  fill(255);
  
  if (w <=0 && wspeed < 0) {
    wspeed *= -.8;
    rstep *= -1;
  }
  else if(w >= width && wspeed > 0) {
    wspeed *= -.8;
    rstep *= -1;
  }
  
  if (h >= lh && hspeed > 0) {
    rstep *= -1;
    hspeed *= -.4;
    System.out.println("bomp");
    if (hspeed > -1) {
      hspeed = 0;
      wspeed = 0;
      noLoop();
    }
  }
  
  textFont(font);
  text("X Position: " + (int)w, 10, 20);
  text("Y Position: " + (int)h, 10, 35);
  text("X Speed: " + (int)wspeed, 10, 70);
  text("Y Speed: " + (int)hspeed, 10, 85);
  text("X Rotation: " + (int)rotx, 10, 120);
  text("Y Rotation: " + (int)roty, 10, 135);
  
  text("Frame Rate: " + (int)frameRate, 10, 160);
  
  
  rotx += rstep;
  roty += rstep * 2;
  if (!mousePressed) {
    h += hspeed;
    w += wspeed;
    hspeed += g;
  }
  
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

void mouseDragged() {
  w = mouseX - 50;
  h = mouseY - 50;
  hspeed = mouseY - pmouseY;
  wspeed = mouseX - pmouseX;
}

