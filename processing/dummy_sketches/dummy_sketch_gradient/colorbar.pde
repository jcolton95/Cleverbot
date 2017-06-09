class colorbar {

  int r;//red
  float x;
  float y;

  float noiseScale = 4;

  colorbar(int tempRed, float tempX, float tempY) {
    r = tempRed;
    x = tempX;
    y = tempY;
  }

  void move() {
    x++;
  }

  void screenwrap() {
    if (x > width) {
      x = -20;
    }
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      fill(r, h%noiseVal, h*noiseVal, 50);
      rect(x, y+h, 30, height);
    }
  }
}