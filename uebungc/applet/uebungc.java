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

public class uebungc extends PApplet {


PImage[] worldImage = new PImage[18];
int[][] stars = new int[30][2];

int step = 0;
int change = 1;

public void setup() {
  size(100, 100);
  frameRate(15);
  background(0);
  
  for (int i = 1; i < 19; i++) {
    if (i < 10) {
      worldImage[i - 1] = loadImage("IMG000" + i + ".GIF");
    }
    else {
      worldImage[i - 1] = loadImage("IMG00" + i + ".GIF");
    }
  }
  for (int i = 0; i < 30; i++) {    
    stars[i][0] = (int)random(100);
    stars[i][1] = (int)random(100);
  }
}

public void mousePressed() {
  change *= -1;
}

public void draw() {
  background(0);
  
  stroke(255);
  for (int i = 0; i < 30; i++) {  
    point(stars[i][0], stars[i][1]);
    stars[i][0] -= change * 5;
    if (stars[i][0] > 99) {
      stars[i][0] = 0;
    }
    else if (stars[i][0] < 0) {
      stars[i][0] = 99;
    }
  }
  
  image(worldImage[step], 25, 25);
  step += change;
  if (step > 17) {
    step = 1;
  }
  else if (step < 1) {
    step = 17;
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "uebungc" });
  }
}
