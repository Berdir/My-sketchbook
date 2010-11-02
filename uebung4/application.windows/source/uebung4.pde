import javax.swing.JFileChooser;
import processing.core.*;
import ddf.minim.*;
import ddf.minim.analysis.FFT;

private Minim minim;
private AudioPlayer song;
private JFileChooser fileChooser;
private String fileName = "waka.mp3";
private FFT fft;

public void setup() {

  size(500, 200);

  frameRate(15);
  fileChooser = new JFileChooser();
  minim = new Minim(this);
  playSound();
}

public void draw() {
  background(0,64,128);
  stroke(255);

  drawFileName();

  for (int i = 0; i < song.bufferSize() - 1; i++) {
    int heightModifier = height / 2;
    line(i, heightModifier + song.mix.get(i) * 50, (i + 1),
    heightModifier + song.mix.get(i + 1) * 50);
    line(i, heightModifier + song.left.get(i) * 50, (i + 1),
    heightModifier + song.left.get(i + 1) * 50);
    line(i, heightModifier + song.right.get(i) * 50, (i + 1),
    heightModifier + song.right.get(i + 1) * 50);
  }

  fft.forward(song.mix);
  for (int i = 0; i < fft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i) * 4);
  }
}

private void drawFileName() {
  PFont font = createFont(PFont.list()[0], 24, true);
  textFont(font);
  textAlign(LEFT);
  fill(255);

  String file = fileName.substring(fileName.lastIndexOf('/') + 1);

  text(file, (width - Math.abs(textWidth(file))) / 2, height / 2);
}

private void playSound() {
  if (song != null) {
    song.close();
  }
  song = minim.loadFile(fileName, 1024);
  song.play();

  fft = new FFT(song.bufferSize(), song.sampleRate());
}

public void mouseClicked() {
  if (mouseButton == LEFT) {
    if (!song.isPlaying()) {
      playSound();
    }
  }
  if (mouseButton == RIGHT) {
    if (fileChooser.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {
      fileName = fileChooser.getSelectedFile().getAbsolutePath();
      playSound();
    }
  }
}

public void stop() {
  try {
    song.close();
    minim.stop();
    super.stop();
  } 
  catch (Exception e) {
    System.out.println(e.getStackTrace());
  }
}


