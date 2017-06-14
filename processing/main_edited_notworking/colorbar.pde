//colorbar

class colorbar {

  float r;
  float g;
  float b;
  float a;
  float x;
  float y;

  float dx; // direction of movement (1 or -1)
  float px; // pace of movement

  float noiseScale = 0.1;

  colorbar(float tempRed, float tempGreen, float tempBlue, float tempAlpha, float xInitial, float yInitial) {
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
    a = tempAlpha;
    x = xInitial;
    y = yInitial;
  }

  void moveX(int tempDirection, int tempPace) {
    dx = tempDirection;
    px = tempPace;

    dx = tempPace;
    px = x+=px;
  }

  void moveY() {
    
  }

  void screenwrap() {
    if (x > width) {
      x = -20;
    }
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      r = h*noiseVal;
      g = h*noiseVal;
      b = h*noiseVal;
      fill(r, g, b, a);
      rect(x, y+h, 30, height);
    }
  }

  void updateEmotionDegree(int d) {
    int x = d - 40;
    r = r + x;
    if (r<0) {
      r = 0;
    }
    if (r > 255) {
      r = 255;
    }
  }
}