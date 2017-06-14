//main

String initInput = "hello";

String prevOutput = initInput;
String prevCs = "";

int totalReactionTone = 0;
int count = 1;

ArrayList<Reaction> reactionsList = new ArrayList<Reaction>();

//Reaction currReaction = new Reaction(getResponse(initInput, ""), 0);

void setup() {
  size(500, 500);
  background(255);
  setup1();
}

void draw() {
  draw1();
}

void mouseClicked() {
  mouseClick1();
}