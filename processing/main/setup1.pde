void setup1(){
  smooth();
  noStroke();

  // r values to be mapped to reactionDegree values
  cb = new colorbar (rd, -20, 0);
  cb2 = new colorbar2 (rd, rd, rd, width+20, 0);
}

void draw1(){
  if (count > 1) {
    int size = reactionsList.size();
    Reaction currReaction = reactionsList.get(size-1);
    //println(currReaction.emotionDegree);
    cb.updateEmotionDegree(currReaction.emotionDegree);

  }
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