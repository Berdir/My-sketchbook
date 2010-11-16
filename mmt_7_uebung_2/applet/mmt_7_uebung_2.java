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

public class mmt_7_uebung_2 extends PApplet {

PImage img;
public void setup() {
  // draw() wird nur einmal aufgerufen
  noLoop();
  img = loadImage("lincoln.png");
    
  size(300, 200);
}

public void draw() {
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
      int mean = color((int)(mr / (steps * steps)), (int)(mg / (steps * steps)), (int)(mb / (steps * steps)));
      fill(mean);
      rect(x + img.width * 2, y, steps, steps);
    }
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "mmt_7_uebung_2" });
  }
}
