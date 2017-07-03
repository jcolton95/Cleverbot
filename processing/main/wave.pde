class Wave {

  int x;
  int y;
  int w;
  int h;

  float startAngle;
  float angleVel;
  //float yaxis;
  float yamplitude;
  int anglepower;
  float border;
  float step;
  float stepAddAmount = 0.0005;
  
  float rDeg = 0;
  
  boolean isVertical = false;

  Wave(int tempX, int tempY, int tempW, int tempH, float tempAngleVel, float tempYAmplitude, int tempAnglePower, float tempBorder, float tempStep) {

    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    fill(255);
    rect(x, y, w, h);

    angleVel = tempAngleVel;
    //yaxis = tempYAxis;
    yamplitude = tempYAmplitude;
    anglepower = tempAnglePower;
    border = tempBorder;
    step = tempStep;
  }


  void display(float tempStartAngle) {
    //clear();
    //background(255);
    //[full] In order to move the wave, we start at a different theta value each frame.  startAngle += 0.02;
    fill(20, 50);
    noStroke();
    rect(x, y, w, h);

    startAngle += tempStartAngle;
    float angle = startAngle;

    //[end]

    float lastx = -999;
    float lasty = -999;
    
    float targetDeg = 2 * currReaction.reactionDegree / 100.0;
    
    if(targetDeg > step) {
      step += stepAddAmount;

    } else {
      step -= stepAddAmount;
    }
    
    float newStep = step * rDeg;
    
    for (float xPos = x; xPos <= w; xPos += step) {
      //float rad = radians(angle);

      //println(rDeg);
      //float y = map(sin(angle), -1, 1, 0, height); //standard sine
      float yPos = map(sin(angle), -1, 1, h, 0) + (height - h); //noise with sine

      //stroke(0);
      //fill(0, 50);
      //stroke( random(255), random(255), random(255), random(255)); 

      stroke(cb.getColor());
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
}