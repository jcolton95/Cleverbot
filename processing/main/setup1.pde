//<<<<<<< HEAD
// Initial thing to start the conversation
String initInput = "hello";

String prevOutput = initInput;
String prevCs = "";

int totalReactionTone = 0;

// list to hold the reactions
ArrayList<Reaction> reactionsList = new ArrayList<Reaction>();

Reaction currReaction;

Colorbar cb;
ConversationHistory cHistory;

wave wave;

void setup1() {
  smooth();
  cb = new Colorbar(color(0, 0, 0), 20, 0, 100);
  cHistory = new ConversationHistory(0, height/2, width, height/2);
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
    if (size > 1) {
      color prevColor = cb.getColor();
      cHistory.addColor(prevColor);  
      cHistory.drawGrid();
    }

    newResponse();
  }
}