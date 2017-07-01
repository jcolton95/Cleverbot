
void setup2() {
  smooth();
  wave = new wave(0.1, height/2, 50, 10, 50, 1);
}


void draw2() {
  background(255);
  //nl.display();
  wave.display(0.02);
}