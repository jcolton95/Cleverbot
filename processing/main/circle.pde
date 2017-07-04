class Circle {
  int x;
  int y;
  int w;
  int h;

  int id;

  float cx;
  float cy;

  float angle = 0.1;
  
  Circle(int tempx, int tempy, int tempw, int temph, int tempid) {
    x = tempx;
    y = tempy;
    w = tempw;
    h = temph;

    id = tempid;
  }


  void display() {
    fill(0, 100);
    noStroke();
    rect(x, y, w, h);


    // move the center of rotation 
    // to the center of the sketch
    //translate(x + w/2, y + h/2);

    // rotate around the center of the sketch
    
    float extData;
    if (id == 0) {
      extData = wave.getStep();
    } else {
      extData = wave2.getStep();
    }
    extData *= 70;
    
    cx = sin(angle) * extData + x + w/2;
    cy = cos(angle) * extData + y + h/2;
    
    fill(cb.getColor());
    ellipse(cx, cy, 10, 10);

    
    angle += 0.1;
  }
  float getCenterX() {
    return cx;
  }
    float getCenterY() {
    return cy;
  }
}