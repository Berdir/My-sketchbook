import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 

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

public class mmt_4_uebung_1 extends PApplet {

  // Minim Import


boolean done = false;

int strokeR = 255;
int strokeG = 255;
int strokeB = 255;


AudioPlayer song;
Minim minim;

public void setup() {
  
  size(512, 200, P2D);
  
  minim = new Minim(this);

  // laden der Sound Datei
  song = minim.loadFile("waka.mp3", 2048);
  // abspielen
  song.play();
  background(0);
}

public void draw()
{
  /*if (!song.isPlaying()) {
    if (!done) {
      song.close();
      song = minim.loadFile("WORLD.mp3");
      done = true;
      song.play();
    }
  }*/

  
  background(0, 0, 0, 5);
  stroke(random(0, 255), random(0, 255), random(0, 255));
    
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < song.left.size() - 1 && i < 512; i++) {
    line(i, 50 + song.left.get(i) * 50, i + 1, 50 + song.left.get(i + 1) * 50);
    line(i, 150 + song.right.get(i) * 50, i + 1, 150 + song.right.get(i + 1) * 50);
  }
}


// Wichtig: schliessen
public void stop() {
  song.close();
  minim.stop();
  super.stop();
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "mmt_4_uebung_1" });
  }
}
