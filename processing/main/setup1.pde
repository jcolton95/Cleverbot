// Initial thing to start the conversation
String initInput = "hello";

String prevOutput = initInput;
String prevCs = "";

int totalReactionTone = 0;

// list to hold the reactions
ArrayList<Reaction> reactionsList = new ArrayList<Reaction>();

Reaction currReaction;
colorbar cb;

void setup1() {
  smooth();
  noStroke();
  cb = new colorbar (127, 0, 127, 255, 5, 0);
}

void draw1() {
  int size = reactionsList.size();
  if (size > 1) {
    currReaction = reactionsList.get(size-1);
  }
  
  cb.move();
  cb.display();
  
  // get new response if at the begining
  if (cb.x <= cb.xBuffer * -1) {
    newResponse();
  }
}

void newResponse() {
  println("===============");

  JSONObject resp = getResponse(prevOutput, prevCs);
  Reaction newReaction = new Reaction(resp, reactionsList.size());
  reactionsList.add(newReaction);
  
  newReaction.print();
  if(reactionsList.size() > 1) {
    cb.updateColorFromReaction(newReaction.reaction);
  }
  
  totalReactionTone += newReaction.reactionTone;

  String output = resp.getString("output");
  String cs = resp.getString("cs");

  prevOutput = output;
  prevCs = cs;
}


void mouseClick1() {
 
}