class Wave {

  int x;
  int y;
  int w;
  int h;

  float startAngle;
  float angleVel;

  float step = 1;
  float stepAddAmount = 0.001;

  int opacity = 40;
  boolean isVertical = false;

  String dataName = "";
  
  Wave(int tempX, int tempY, int tempW, int tempH, float tempAngleVel, String tempDataName) {

    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    angleVel = tempAngleVel;
    dataName = tempDataName;
  }


  void display(float tempStartAngle) {

    //[full] In order to move the wave, we start at a different theta value each frame.  startAngle += 0.02;

    fill(5, opacity);
    noStroke();
    rect(x, y, w, h);
    
    startAngle += tempStartAngle;
    float angle = startAngle;

    float lastx = -999;
    float lasty = -999;

    float targetDeg;
    if (dataName == "ed") {
      targetDeg = 2 * currReaction.emotionDegree / 100.0;
    } else {
      targetDeg = 2 * currReaction.reactionDegree / 100.0;
    }

    if (targetDeg > step) {
      step += stepAddAmount;
    } else {
      step -= stepAddAmount;
    }

    for (float xPos = x; xPos <= w; xPos += step * 2) {
      //float rad = radians(angle);
      //float y = map(sin(angle), -1, 1, 0, height); //standard sine
      float yPos = map(sin(angle), -1, 1, h-1, 1) + (height - (height - y)); //noise with sine

      //stroke(cb.getColor());
      stroke(255);
      strokeWeight(2);

      if (lastx > -999) {
        if (isVertical) {
          line(yPos, xPos, lasty, lastx);
        } else {
          line(xPos, yPos, lastx, lasty);
        }
      }

      lastx = xPos;
      lasty = yPos;
      angle += angleVel;
    }
    

  }
  float getStep () {
    return step;
  }
  
  float getAngle() {
   return startAngle;
  }
}