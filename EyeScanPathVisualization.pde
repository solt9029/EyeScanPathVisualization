final int WINDOW_WIDTH = 1920;
final int WINDOW_HEIGHT = 1080;
PImage background;
String [] lines;

void settings() {
  background = loadImage("background.png");
  lines = loadStrings("data.csv");
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
  noLoop();
}

void draw() {
  background(255);
  image(background, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
  
  // 線を描画する
  for (int i = 0; i < lines.length - 1; i++) {
    String [] currentItems = split(lines[i], ',');
    int currentX = int(currentItems[0]);
    int currentY = int(currentItems[1]);
    String [] nextItems = split(lines[i + 1], ',');
    int nextX = int(nextItems[0]);
    int nextY = int(nextItems[1]);
    
    stroke(255, 0, 0, 100);
    line(currentX, currentY, nextX, nextY);
  }
  
  // 円を描画する
  for (int i = 0; i < lines.length; i++) {
    String [] currentItems = split(lines[i], ',');
    int currentX = int(currentItems[0]);
    int currentY = int(currentItems[1]);
    int currentDuration = int(currentItems[2]);
    
    stroke(255, 0, 0, 100);
    fill(255, 0, 0, 100);
    ellipse(currentX, currentY, currentDuration / 5, currentDuration / 5);
    
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text(i + 1, currentX, currentY + 10);
  }
}