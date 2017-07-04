/*
  A module that displays the emotional history of the conversation
 */
class ConversationHistory {
  IntList colors = new IntList();
  int canvasWidth;
  int canvasHeight;
  int canvasStartX;
  int canvasStartY;
  color averageColor = color(0, 0, 0);

  ConversationHistory (int x, int y, int w, int h) {
    canvasWidth = w;
    canvasHeight = h;
    canvasStartX = x;
    canvasStartY = y;
    
    fill(0);
    rect(x, y, w, h);
  }

  void addColor(color col) {
    colors.append(col);
    float newR = (red(col) + red(averageColor)) / colors.size();
    float newG = (green(col) + green(averageColor)) / colors.size();
    float newB = (blue(col) + blue(averageColor)) / colors.size();
    
    //float newH = (hue(col) + hue(averageColor)) / colors.size();
    
    //println("curr avg:", red(averageColor), green(averageColor), blue(averageColor));
    //println(newR, newG, newB);
    
    averageColor = color(newR, newG, newB);
    drawAverage();
  }

  void drawGrid() {

    int numCols = colors.size();
    float rectWidth = canvasWidth / numCols;

    for (int i = 0; i < colors.size(); i++) {

      float x = canvasStartX + i * rectWidth;
      int y = canvasStartY + 20;

      fill(colors.get(i));
      noStroke();
      rect(x, y, rectWidth, canvasHeight);
    }
  }

  color getAverage() {
    return averageColor;
  }

  void drawAverage() {
    noStroke();
    fill(255,255,255);

    fill(averageColor);
    rect(canvasStartX, canvasStartY, width, 20);
  }
}