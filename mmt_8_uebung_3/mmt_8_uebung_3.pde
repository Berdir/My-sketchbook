void setup() {
 size(300, 300);
 background(0); 
 noLoop();
}

void draw() {
  stroke(255);
  
  for (int i = 0; i < 255; i++) {
    System.out.println("x=" + x + ", y=" + y);
    line(x, y, width/2, height/2);
    
    x += xStep;
    y += yStep;
  }
}
