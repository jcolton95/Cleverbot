String initInput = "hello";

String prevOutput = initInput;
String prevCs = "";

int totalReactionTone = 0;
int count = 0;

class Reaction {
  
  String cs;
  String output;
  
  String reaction = "";
  Integer reactionTone = 0;
  Integer reactionDegree = 0;
  String reactionValues = "";
  Integer emotionDegree = 0;
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
    int x_initial = 0;
    int y_initial = 0;
    float r = (reactionDegree / 80.0) * width;

    if(isFirst) {
       x_initial = width;
       y_initial = height;
       //r = width - r;
    }
    float theta = (reactionDegree * 90 / 80.0) * PI / 180;
    
    println("radius", r);
    println("theta", theta);
    
    

    float x1 = r * cos(theta);
    float y1 = r * sin(theta);
    strokeWeight(1);
    pushMatrix();
    
    rotate(theta);
    translate(50, 50);
    line(x_initial, y_initial, r, 0);
    
    popMatrix();
    //int x_initial = width;
    //int y_initial = height;
    //int x = ;
    //int y;
    //line(x,y)
  }
}

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  //background(255);
  //fill(0);
  //text(prevOutput, 0, 0, width, height);
  //text("tone:" + totalReactionTone, 0, 50, width, height);
}

void mouseClicked() {
  JSONObject resp = getResponse(prevOutput, prevCs);
  Reaction newReaction = new Reaction(resp, count);
  newReaction.print();
  newReaction.drawSelf();
  totalReactionTone += newReaction.reactionTone;
  
  String output = resp.getString("output");
  String cs = resp.getString("cs");

  prevOutput = output;
  prevCs = cs;
  
  count++;
}

JSONObject getResponse(String input, String prevCs) {
  String stringWithoutSpaces = input.replaceAll("\\s+", "+");
  String url = "http://www.cleverbot.com/getreply?key=" + APIKEY + "&input=" + stringWithoutSpaces + "&cs=" + prevCs + "&cb_settings_emotion=yes";
  String [] response = loadStrings(url);
  saveStrings("data.json", response);
  JSONObject jobj = loadJSONObject("data.json");
  return(jobj);
}