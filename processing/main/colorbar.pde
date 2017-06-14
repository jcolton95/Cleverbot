class colorbar {

  float r; // red
  float g; // green
  float b; // blue
  float a; // alpha
  float x;
  float y;

  int d; // direction
  float p; // pace

  float noiseScale = random(0.01,1);

  colorbar (int tempRed, int tempGreen, int tempBlue, int tempAlpha, float tempX, float tempY) {
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
    a = tempAlpha;
    x = tempX;
    y = tempY;
  }

  void move() {
    x++;
  }

  void screenwrap() {
    if (x > width + 20) {
      x = -20;
      noiseScale = noiseScale + random(-r, r);
    }
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      fill(r/noiseVal, g, b/noiseVal, a);
      rect(x, y+h, 5, 1);
    }
  }

  void updateEmotionDegree (int d) {
    if (x < -19) {
      int i = d - 50;
      r = r + i;
      if (r < 0) {
        r = 0;
      }
      if (r > 255) {
        r = 255;
      }
    }
  }
}