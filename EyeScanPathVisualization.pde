final int WINDOW_WIDTH = 1920;
final int WINDOW_HEIGHT = 1080;
final boolean is_animated = false;

PImage background;
String [] lines;
float [][] data;

void settings() {
  background = loadImage("background.png");
  lines = loadStrings("data.csv");
  data = new float [lines.length][5];
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
  
  for (int i = 0; i < lines.length; i++) {
    String [] items = split(lines[i], ',');
    data[i][0] = float(items[0]);
    data[i][1] = float(items[1]);
    data[i][2] = float(items[2]);
    data[i][3] = float(items[3]);
    data[i][4] = float(items[4]);
  }
}

void draw() {
  background(255);
  image(background, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
  
  if (is_animated) {
    dynamicDraw();
  } else {
    staticDraw();
  }
}

void dynamicDraw() {
  float time = data[0][2] + millis();
  for (int i = 0; i < data.length; i++) {
    // 開始時間を過ぎている
    if (data[i][2] < time) {
      // 終了時間を過ぎている
      if (data[i][3] < time) {
        stroke(255, 0, 0, 100);
        fill(255, 0, 0, 100);
        ellipse(data[i][0], data[i][1], data[i][4] / 5, data[i][4] / 5);
      } else {
        stroke(255, 0, 0, 100);
        fill(255, 0, 0, 100);
        ellipse(data[i][0], data[i][1], (time - data[i][3]) / 5, (time - data[i][3]) / 5);
      }
      if (i > 0) {
        stroke(255, 0, 0, 100);
        line(data[i - 1][0], data[i - 1][1], data[i][0], data[i][1]);
      }
    }
  }
}

void staticDraw() {
  // 線を描画する
  for (int i = 0; i < data.length - 1; i++) {
    stroke(255, 0, 0, 100);
    line(data[i][0], data[i][1], data[i + 1][0], data[i + 1][1]);
  }
  
  // 円と数字を描画する
  for (int i = 0; i < data.length; i++) {
    stroke(255, 0, 0, 100);
    fill(255, 0, 0, 100);
    ellipse(data[i][0], data[i][1], data[i][4] / 5, data[i][4] / 5);
    
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text(i + 1, data[i][0], data[i][1] + 10);
  }
  
  save("output.png");
  
  noLoop();
}