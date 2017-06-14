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

  String testInput = "      agreement  ";
  //testInput = testInput.trim();
  //println(testInput, testInput.equals("agreement"));
  String testOut = getEmotionCategory(testInput);
  println(testInput + " is in category: ", testOut);
}

void draw() {
  draw1();
  newResponse();
}

void mouseClicked() {
  //mouseClick1();
}