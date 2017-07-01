/*
  A bar of color that moves across the screen, leaving a path of color.
*/
class colorbar {
  int xBuffer;
  float r; // red
  float g; // green
  float b; // blue
  float a; // alpha
  float x;
  float y;

  int d;   // direction
  float p; // pace

  float noiseScale = random(0.01,1);

  colorbar (int tempRed, int tempGreen, int tempBlue, int tempAlpha, int tempXBuffer, float tempY) {
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
    a = tempAlpha;
    xBuffer = tempXBuffer;
    x = tempXBuffer * -1;
    y = tempY;
  }

  void move() {
    x++;
    if (x > width + xBuffer) {
      screenwrap(); 
    }
  }

  void screenwrap() {
    x = -1 * xBuffer;
    noiseScale = noiseScale + random(-r, r);
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      fill(r/noiseVal, g, b/noiseVal, a);
      rect(x, y+h, 5, 1);
    }
  }

  // updates the color based on the reaction description
  void updateColorFromReaction(String input) {

    // gets category from reaction
    String emotionCategory = getEmotionCategory(input);
    
    println("updating color", emotionCategory);
    if (emotionCategory == "anger") {
      r = 175;
      g = 7;
      b = 7;
    }
    if (emotionCategory == "sad") {
      r = 145;
      g = 169;
      b = 242;
    }
    if (emotionCategory == "love") {
      r = 255;
      g = 0;
      b = 106;
    }
    if (emotionCategory == "disgust") {
      r = 77;
      g = 170;
      b = 37;
    }
    if (emotionCategory == "like") {
      r = 115;
      g = 239;
      b = 146;
    }
    if (emotionCategory == "laughing") {
      r = 255;
      g = 255;
      b = 22;
    }
    if (emotionCategory == "surprise") {
      r = 255;
      g = 170;
      b = 10;
    }
  }
}