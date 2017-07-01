class wave {

  float startAngle;
  float angleVel;
  float yaxis;
  float yamplitude;
  int anglepower;
  float border;
  float step;


  wave(float tempAngleVel, float tempYAxis, float tempYAmplitude, int tempAnglePower, float tempBorder, float tempStep) {
    angleVel = tempAngleVel;
    yaxis = tempYAxis;
    yamplitude = tempYAmplitude;
    anglepower = tempAnglePower;
    border = tempBorder;
    step = tempStep;
  }


  void display(float tempStartAngle) {
    background(255);
    //[full] In order to move the wave, we start at a different theta value each frame.  startAngle += 0.02;
    startAngle += tempStartAngle;
    float angle = startAngle;
    //[end]

    float lastx = -999;
    float lasty = -999;

    for (float x = border; x <= width-border; x += step) {
      float rad = radians(angle);
      //float y = map(sin(angle), -1, 1, 0, height); //standard sine
      float y = map(sin(noise(angle)), -1, 1, 0, height); //noise with sine
      //float y = yaxis + map((pow(sin(rad), anglepower) * noise(rad*2) * yamplitude), -1, 1, 0, height); //noisy line integrated with sine (attempt; not working)
      stroke(0);
      fill(0, 50);
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
      angle += angleVel;
    }
  }
}