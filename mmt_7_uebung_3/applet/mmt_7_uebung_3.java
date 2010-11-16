import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class mmt_7_uebung_3 extends PApplet {

PImage img;

int mean = 255/2;

public void setup() {
  img = loadImage("lincoln.png");
    
  size(350, 250);
  update();
}

public void draw() {
  
}

public void keyPressed() {
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

public void update() {
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
        int col = get(x, y);
        int grey = (int)((col >> 16 & 0xFF) * 0.212671f + (255 - col >> 8 & 0xFF) * 0.715160f + (255 - col & 0xFF) * 0.072169f);
        set(x + img.width, y, color(grey > mean ? 0 : 255));
    }
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "mmt_7_uebung_3" });
  }
}
