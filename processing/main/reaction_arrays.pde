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

int findInArray(String input, String[] arr) {
  for (int i = 0; i < arr.length; i++) {
    //println(arr[i]); 
    if (input.trim().equals(arr[i])) {
      return i;
    }
  }
  return -1;
}

String getEmotionCategory(String input) {
  for (int i = 0; i < responseLists.length; i++) {
   if (findInArray(input, responseLists[i]) >= 0) {
     return responseCategories[i];
   }
  }
  return input + " WAS NOT FOUND";
}