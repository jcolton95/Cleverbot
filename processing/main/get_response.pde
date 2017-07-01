// adds a new response
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


// returns a JSON object that is the Cleverbot API response to the input string and conversation history
JSONObject getResponse(String input, String prevCs) {
  String stringWithoutSpaces = input.replaceAll("\\s+", "+");
  String url = "http://www.cleverbot.com/getreply?key=" + APIKEY + "&input=" + stringWithoutSpaces + "&cs=" + prevCs + "&cb_settings_emotion=yes";
  String [] response = loadStrings(url);
  saveStrings("data.json", response);
  JSONObject jobj = loadJSONObject("data.json");
  return(jobj);
}