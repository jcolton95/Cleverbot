class noisyline {

  float border;
  float yaxis;
  float yamplitude;
  float ynoise;
  float ynoisestep;
  float anglestep;
  int anglepower;
  int step;
  int strokeweight;
  int r;
  int g;
  int b;

  noisyline(float tempBorder, float tempYAxis, float tempYAmplitude, float tempYNoise, float tempYNoiseStep, float tempAngleStep, int tempAnglePower, int tempStep, int tempStrokeWeight, int tempRed, int tempGreen, int tempBlue) { 
    border = tempBorder;
    yaxis = tempYAxis;
    yamplitude = tempYAmplitude;
    ynoise = tempYNoise;
    ynoisestep = tempYNoiseStep;
    anglestep = tempAngleStep;
    anglepower = tempAnglePower;
    step = tempStep;
    strokeweight = tempStrokeWeight;
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
  }

  void display() {
    float lastx = -999;
    float lasty = -999;
    float angle = 0;
    float y;
    for (float x = border; x <= width-border; x += step) {
      float rad = radians(angle);
      y = yaxis + (pow(sin(rad), anglepower) * noise(rad*2) * yamplitude); //noise with sin
      //y = yaxis + noise(ynoise) * yamplitude; //standard noise
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
      //ynoise += ynoisestep;
      angle += anglestep;
    }
  }
}