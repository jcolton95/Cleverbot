class Reaction {
  
  String cs;
  String output;
  
  String reaction = "";
  int reactionTone = 0;
  int reactionDegree = 0;
  String reactionValues = "";
  int emotionDegree = 0;
  String emotionValues = "";
  
  int id = 0;
  boolean isFirst = true;
  
  Reaction(JSONObject resp, int count) {
    cs = resp.getString("cs");
    output = resp.getString("output");
    id = count;
    
    if(count % 2 == 0) {
      isFirst = true;
    } else {
      isFirst = false;
    }
    
    reaction = resp.getString("reaction");
    //println("reaction:", reaction);
    
    if(reaction.length() > 0){
      //println("nonempty reaction");
      reactionTone   = Integer.parseInt(resp.getString("reaction_tone"));
      reactionDegree = Integer.parseInt(resp.getString("reaction_degree"));
      emotionDegree  = Integer.parseInt(resp.getString("emotion_degree"));
      reactionValues = resp.getString("reaction_values");
      emotionValues  = resp.getString("emotion_values");
    }
  }
  
  void print() {
    println(output, "(", "r:", reaction, ", rt:", reactionTone, ", rd:", reactionDegree, ", rvs:", reactionValues, ", ed:", emotionDegree, ", evs:", emotionValues, ")");
  }
  
  void drawSelf(){

  }
}