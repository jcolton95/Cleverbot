class colorbar {

  int r;//red
  float x;
  float y;

  colorbar(int tempRed, float tempX, float tempY) {
    r = tempRed;
    x = tempX;
    y = tempY;
  }

void move(){
  x++;
}

  void screenwrap() {
    if (x > width) {
      x = -20;
    }
  }

  void display() {
    for (int h = 0; h <= height; h+=1) {
      fill(r, h%random(50, 255), h*random(-200, 15), 50);
      rect(x, y+h, 5, height);
    }
  }
}