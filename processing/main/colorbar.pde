/*
  A bar of color that moves across the screen, leaving a path of color.
*/
class Colorbar {
  int xBuffer;
 
  float x;
  float y;

  int d;   // direction
  float p; // pace

  float noiseScale = random(0.01,1);

  color startColor;
  color displayColor;
  color targetColor;
  
  Colorbar (color initColor, int tempXBuffer, float tempY, float tempPace) {

    startColor = initColor;
    displayColor = initColor;
    
    xBuffer = tempXBuffer;
    x = tempXBuffer * -1;
    y = tempY;
    p = tempPace;
  }

  void move() {
    x++;
    if (x > width + xBuffer) {
      screenwrap(); 
    }
  }

  void screenwrap() {
    x = -1 * xBuffer;
    //noiseScale = noiseScale + random(-r, r);
    startColor = displayColor;
  }

  void display() {
    noStroke();
    int maxHeight = height/2;
    
    for (int h = 0; h <= maxHeight - 1; h++) {
      float colorNoiseVal = noise(x*noiseScale, y*noiseScale);
      //fill(r/colorNoiseVal, g/colorNoiseVal, b/colorNoiseVal, a);
      
      float amt = x/width;
      color newColor = lerpColor(startColor, targetColor, amt);
      displayColor = newColor;
      
      fill(displayColor, 127);

      rect(x, y+h, 5, 1);
    }
  }

  // updates the color based on the reaction description
  void updateColorFromReaction(String input) {
    // gets category from reaction
    String emotionCategory = getEmotionCategory(input);
    targetColor = getColorForEmotionCategory(emotionCategory);
    println("updating color", emotionCategory);
  }
  
  color getColor() {
    return displayColor; 
  }
}