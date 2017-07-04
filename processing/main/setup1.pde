// Initial thing to start the conversation
String initInput = "who is rollo carpenter?";

String prevOutput = initInput;
String prevCs = "";

int totalReactionTone = 0;

// list to hold the reactions
ArrayList<Reaction> reactionsList = new ArrayList<Reaction>();

Reaction currReaction;

Colorbar cb;
ConversationHistory cHistory;

Wave wave;
Wave wave2;

Circle circ;
Circle circ2;

void setup1() {
  smooth();
  cb = new Colorbar(color(0, 0, 0), 20, 0, 100);
  cHistory = new ConversationHistory(0, height/2, width, height/2);
  
  wave = new Wave(0, height - 40, width, 40, 0.1, "ed");  
  wave2 = new Wave(0, height - 80, width, 40, 0.1, "rd");
  
  circ = new Circle(0, height - 280, width/2, 200, 0);
  circ2 = new Circle(width/2, height - 280, width/2, 200, 1);
  
  newResponse();
  newResponse();
}


void draw1() {
  int size = reactionsList.size();
  if (size > 1) {
    currReaction = reactionsList.get(size-1);
  }

  cb.move();
  cb.display();
  wave.display(0.2);
  wave2.display(0.2);

    
  circ.display();
  circ2.display();
  
  stroke(255, 100);
  strokeWeight(4);
  line(circ.getCenterX(), circ.getCenterY(), width, (height-280));
  line(circ2.getCenterX(), circ2.getCenterY(), 0, (height-280));
  line(circ.getCenterX(), circ.getCenterY(), width, (height-80));
  line(circ2.getCenterX(), circ2.getCenterY(), 0, (height-80));
  line(circ2.getCenterX(), circ2.getCenterY(), circ.getCenterX(), circ.getCenterY());

  
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