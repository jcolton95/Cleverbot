String [] likeList = {
  "happy", 
  "nice", 
  "genuine smile ", 
  "agreement", 
  "pleased", 
  "relieved", 
  "interested", 
  "agreeable", 
  "nice hello ", 
  "nice goodbye ", 
  "calm", 
  "modest", 
  "relaxed", 
  "curious", 
  "determined", 
  "questioning", 
  "contemplative", 
  "smug", 
  "knowing", 
  "shy", 
  "look left ", 
  "look right ", 
  "look up ", 
  "look down"
};

String [] loveList = {
  "love", 
  "sympathy", 
  "supportive", 
  "positive", 
  "appreciation", 
  "very happy ", 
  "gentle", 
  "belief", 
  "thoughtful", 
  "dancing", 
  "serious", 
  "excited", 
  "proud", 
  "sweetness", 
  "singing", 
  "flirty", 
  "righteous", 
  "sure", 
  "victorious"
};

String [] laughingList = {
  "ha!", 
  "nice laugh", 
  "nasty laugh", 
  "giggling", 
  "sniggering", 
  "mocking", 
  "joking", 
  "silly", 
  "wry smile", 
  "sarcastic smile ", 
  "amused", 
  "naughty", 
  "tongue out", 
  "winking"
};

String [] surpriseList = {
  "shocked", 
  "aah", 
  "disbelief", 
  "amazed", 
  "surprised", 
  "jumpy", 
  "impressed", 
  "alert"
};

String [] sadList = {
  "crying", 
  "very sad ", 
  "upset", 
  "frowning", 
  "sad", 
  "uninterested", 
  "sigh", 
  "apologetic", 
  "disappointed", 
  "disinterested", 
  "confused", 
  "uncomfortable", 
  "embarrassed", 
  "disagreement", 
  "reluctant", 
  "worried", 
  "concerned", 
  "distracted", 
  "doubting", 
  "forgetful", 
  "guilty", 
  "lazy", 
  "none", 
  "bored", 
  "sleepy", 
  "tired", 
  "unsure", 
  "robotic"
};

String [] angerList = {
  "furious", 
  "infuriated", 
  "angry", 
  "scared", 
  "shouting", 
  "frustrated", 
  "nasty goodbye", 
  "indignation", 
  "mean", 
  "annoyed", 
  "argumentative", 
  "assertive", 
  "stubborn"
};

String [] disgustList = {
  "eek!",
  "eek",
  "hatred", 
  "disgust", 
  "sneering", 
  "sarcastic", 
  "displeased", 
  "negative", 
  "unimpressed", 
  "reluctant hello", 
  "nosey", 
  "rude", 
  "uncomfortable"
};


String [] [] responseLists = {likeList, loveList, laughingList, surpriseList, sadList, angerList, disgustList};
String [] responseCategories = {"like", "love", "laughing", "surprise", "sad", "anger", "disgust"};

// finds input in the given array arr
// returns the index if found, -1 if not
int findInArray(String input, String[] arr) {
  for (int i = 0; i < arr.length; i++) {
    //println("Comparing " + input + " with " + arr[i]);
    if (input.trim().equals(arr[i].trim())) {
      return i;
    }
  }
  return -1;
}

// returns the emotion cateogry for the given input
// categories are: like, love, laughing, surprise, sad, anger, disgust
String getEmotionCategory(String input) {
  for (int i = 0; i < responseLists.length; i++) {
    if (findInArray(input, responseLists[i]) >= 0) {
      return responseCategories[i];
   }
  }
  return input + " WAS NOT FOUND";
}

color getColorForEmotionCategory(String input) {
  int r = 0;
  int g = 0;
  int b = 0;
  if (input == "anger") {
    r = 175;
    g = 7;
    b = 7;
  }
  if (input == "sad") {
    r = 145;
    g = 169;
    b = 242;
  }
  if (input == "love") {
    r = 255;
    g = 0;
    b = 106;
  }
  if (input == "disgust") {
    r = 77;
    g = 170;
    b = 37;
  }
  if (input == "like") {
    r = 115;
    g = 239;
    b = 146;
  }
  if (input == "laughing") {
    r = 255;
    g = 255;
    b = 22;
  }
  if (input == "surprise") {
    r = 255;
    g = 170;
    b = 10;
  }
  return(color(r, g, b));
  
}