colorbar cb;
colorbar cb2;

noisyline nl;

void setup1() {
  smooth();

  cb = new colorbar(127, 0, 127, 127, -20, 0, 100);
  cb2 = new colorbar(127, 0, 127, 127, -20, width/2, 100);
  
  nl = new noisyline (50, height/2, 50, random(10), 0.1, 10, 5, 20, 50, 70);
}

Reaction currReaction;

void draw1() {
  if (count > 2) {
    int size = reactionsList.size();
    currReaction = reactionsList.get(size-1);
    //println(currReaction.emotionDegree);
    //cb.updateEmotionDegree(currReaction.emotionDegree);
  }
  cb.move();
  cb.screenwrap();
  cb.display();
  cb2.move();
  cb2.screenwrap();
  cb2.display();
}

void draw2() {
  nl.display();
}

void newResponse() {
  if (cb.x < -19) {
    if (count > 2) {
      cb.updateColorFromReaction(currReaction.reaction);
    }

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