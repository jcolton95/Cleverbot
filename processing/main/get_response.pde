// returns a JSON object that is the Cleverbot API response to the input string and conversation history
JSONObject getResponse(String input, String prevCs) {
  String stringWithoutSpaces = input.replaceAll("\\s+", "+");
  String url = "http://www.cleverbot.com/getreply?key=" + APIKEY + "&input=" + stringWithoutSpaces + "&cs=" + prevCs + "&cb_settings_emotion=yes";
  String [] response = loadStrings(url);
  saveStrings("data.json", response);
  JSONObject jobj = loadJSONObject("data.json");
  return(jobj);
}