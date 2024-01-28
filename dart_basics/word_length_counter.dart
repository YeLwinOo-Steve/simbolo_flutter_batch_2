// TODO: test this code at https://dartpad.dev

void main(){
  List<String> words = ["apple","xiaomi","samsung"];

  final countedWords = wordLengths(words);

  print(countedWords); // {"apple": 5,"xiaomi": 6,"samsung": 8}
}

Map<String, int> wordLengths(List<String> words) {
 return Map.fromIterable(words, key: (word) => word, value: (word) => word.length);
}