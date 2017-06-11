class colorbar2 {

  int r;//red
  float g;
  float b;
  float x;
  float y;

  float noiseScale = 0.1;

  colorbar2 (int tempRed, int tempGreen, int tempBlue, float tempX, float tempY) {
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
    x = tempX;
    y = tempY;
  }

  void move() {
    x--;
  }

  void screenwrap() {
    if (x < -20) {
      x = width+20;
    }
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      g = h*noiseVal;
      b = h*noiseVal;
      fill(r, g, b, 50);
      rect(x, y+h, 30, height);
    }
  }
}