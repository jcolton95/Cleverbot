//visual_experiment_03
//June 9, 2017

checkergrid cg;

int rd1 = (int)random(0, 100);
int rd2 = (int)random(0, 100);

int ed = (rd1+rd2)/2;

void setup() {
  //size(800, 800);
  size(1720, 1080);
  background(255);

  //cg = new checkergrid(rd1, rd2, 80, 80);
}

void mousePressed() {
  cg = new checkergrid((int)random(0,100), (int)random(0,100), ed, ed);
  cg.grid();
  cg.fills(ed, ed, ed);
}

void draw() {
  background(255);
  cg = new checkergrid((int)random(0,100), (int)random(0,100), ed, ed);
  cg.grid();
  cg.fills(ed, ed, ed);
}