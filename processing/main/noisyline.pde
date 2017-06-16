class noisyline {

  float border;
  float yaxis;
  float yamplitude;
  float ynoise;
  float ynoisestep;
  int step;
  int strokeweight;
  int r;
  int g;
  int b;

  noisyline(float tempBorder, float tempYAxis, float tempYAmplitude, float tempYNoise, float tempYNoiseStep, int tempStep, int tempStrokeWeight, int tempRed, int tempGreen, int tempBlue) { 
    border = tempBorder;
    yaxis = tempYAxis;
    yamplitude = tempYAmplitude;
    ynoise = tempYNoise;
    ynoisestep = tempYNoiseStep;
    step = tempStep;
    strokeweight = tempStrokeWeight;
    r = tempRed;
    g = tempGreen;
    b = tempBlue;
  }

  void display() {
    float lastx = -999;
    float lasty = -999;
    float y;
    for (float x = border; x <= width-border; x += step) {
      y = yaxis + noise(ynoise) * yamplitude;
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
      ynoise += ynoisestep;
    }
  }
}