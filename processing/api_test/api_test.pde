String initInput = "hello";

String prevOutput = initInput;
String prevCs = "";

String emotionDegree = "";
String reaction = "";
String reactionTone = "";
String reactionDegree = "";
String emotionValues = "";
String reactionValues = "";

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);
  fill(0);
  text(prevOutput, 10, height/2);
  fill(80);
  text(reaction, 10, height/2+50);
  //println(response);
}

void mouseClicked() {
  JSONObject resp = getResponse(prevOutput, prevCs);
  //println(resp);
  emotionDegree = resp.getString("emotion_degree");
  reaction = resp.getString("reaction");
  reactionTone = resp.getString("reaction_tone");
  reactionDegree = resp.getString("reaction_degree");
  emotionValues = resp.getString("emotion_values");
  reactionValues = resp.getString("reaction_values");

  String output = resp.getString("output");
  String cs = resp.getString("cs");
  println(output, "(", "r:", reaction, ", rt:", reactionTone, ", rd:", reactionDegree, ", rvs:", reactionValues, ", ed:", emotionDegree, ", evs:", emotionValues, ")");

  prevOutput = output;
  prevCs = cs;
}

JSONObject getResponse(String input, String prevCs) {
  String stringWithoutSpaces = input.replaceAll("\\s+", "+");
  String url = "http://www.cleverbot.com/getreply?key=" + APIKEY + "&input=" + stringWithoutSpaces + "&cs=" + prevCs + "&cb_settings_emotion=yes";
  String [] response = loadStrings(url);

  //for (String s : response) {
  //println(s);
  //}

  saveStrings("data.json", response);
  JSONObject jobj = loadJSONObject("data.json");
  //println(jobj.getString("output"));

  return(jobj);
}