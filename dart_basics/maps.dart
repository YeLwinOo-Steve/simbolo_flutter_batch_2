void main() {
  Map<String, dynamic> book = {
    'title': 'Clean Architecture',
    'author': 'Uncle Bob',
    'pages': 200,
  };
  book['published'] = 2001;

  print(book.keys);
  print(book.values);
  book.values.toList();

  for (MapEntry b in book.entries) {
    print('Key ${b.key}, Value ${b.value}');
  }

  book.forEach((k, v) => print("Key : $k, Value : $v"));
}
