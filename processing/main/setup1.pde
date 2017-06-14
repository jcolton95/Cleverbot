void setup1() {
  smooth();
  noStroke();

  cb = new colorbar (127, 0, 127, 255, -20, 0);
}


void draw1() {
  if (count > 1) {
    int size = reactionsList.size();
    Reaction currReaction = reactionsList.get(size-1);
    //println(currReaction.emotionDegree);
    cb.updateEmotionDegree(currReaction.emotionDegree);
  }
  cb.move();
  cb.screenwrap();
  cb.display();
}


void newResponse() {
  if (cb.x < -19) {
    JSONObject resp = getResponse(prevOutput, prevCs);
    Reaction newReaction = new Reaction(resp, count);


    newReaction.print();
    totalReactionTone += newReaction.reactionTone;

    reactionsList.add(newReaction);

    String output = resp.getString("output");
    String cs = resp.getString("cs");

    prevOutput = output;
    prevCs = cs;

    count++;
  }
}


void mouseClick1() {
  JSONObject resp = getResponse(prevOutput, prevCs);
  Reaction newReaction = new Reaction(resp, count);


  newReaction.print();
  totalReactionTone += newReaction.reactionTone;

  reactionsList.add(newReaction);

  String output = resp.getString("output");
  String cs = resp.getString("cs");

  prevOutput = output;
  prevCs = cs;

  count++;
}