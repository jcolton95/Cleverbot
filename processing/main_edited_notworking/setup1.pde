//setup1
//June 10, 2017
//printing gradient responding to reaction values

Reaction react;
colorbar cb;

void setup1(){
  
  smooth();
  noStroke();

  // r values to be mapped to reactionDegree values
  cb = new colorbar (react.reactionDegree, 10, 10, 255, -20, 0);
}

void draw1(){
  if (count > 1) {
    int size = reactionsList.size();
    Reaction currReaction = reactionsList.get(size-1);
    //println(currReaction.emotionDegree);
    cb.updateEmotionDegree(currReaction.emotionDegree);

  }
  cb.moveX(0, 1);
  //cb.screenwrap();
  cb.display();
}

void mouseClick1() {
  JSONObject resp = getResponse(prevOutput, prevCs);
  //Reaction newReaction = new Reaction(resp, count);
  react = new Reaction(resp, count);
  
  
  react.print();
  totalReactionTone += react.reactionTone;
  
  reactionsList.add(react);
  
  String output = resp.getString("output");
  String cs = resp.getString("cs");

  prevOutput = output;
  prevCs = cs;
  
  count++;
}