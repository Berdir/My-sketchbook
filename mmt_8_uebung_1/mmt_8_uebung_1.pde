import fullscreen.*; 

FullScreen fs;

void setup() {
  size(screen.width, screen.height);
  frameRate(20);
  noStroke();
  background(255, 255, 255);
  
  // Create the fullscreen object
  fs = new FullScreen(this); 
  
  // enter fullscreen mode
  fs.enter(); 
}

void draw() {
  Random r = new Random();
  int alphac = (int)((mouseY /(float) height) * 155) + 100;
  fill(r.nextInt(255), r.nextInt(255), r.nextInt(255), alphac);
  int d = (int)((mouseX / (float) width) * 200);
  ellipse(r.nextInt(width), r.nextInt(height), d, d);
}
