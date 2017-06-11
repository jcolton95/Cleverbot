//dummy_sketch_gradient
//dummy data for a sketch involving gradient print that reflects conversation tone


colorbar cb;
colorbar2 cb2;

//ArrayList reactions;
//int reaction_index;
//int previous_index;

int rd = (int)random(0, 100); //reactionDegree


void setup() {
  size(1080, 1000);
  colorMode(RGB);
  background(0);
  smooth();
  noStroke();

  // r values to be mapped to reactionDegree values
  cb = new colorbar (rd, -20, 0);
  cb2 = new colorbar2 (rd, rd, rd, width+20, 0);
}


void mousePressed() {
}


void draw() {
  cb.move();
  //cb.screenwrap();
  cb.display();
  cb2.move();
  //cb2.screenwrap();
  cb2.display();

  if (cb.x > width + 20) {
    cb.x = -20;
    cb.noiseScale = random(-0.1, 0.1);
  }
  if (cb2.x < -20) {
    cb2.x = width + 20;
    cb2.noiseScale = cb.noiseScale + random(-0.1, 0.1);
  }

  if (cb.x == cb2.x) {
    cb.noiseScale = cb2.noiseScale = cb2.noiseScale + 0.01;
    cb2.noiseScale = cb.noiseScale = cb.noiseScale = 0.01;
  }
}