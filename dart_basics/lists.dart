void main() {
  List<int> list = [1, 2, 3, 4, 5];

  list[0];

  list.sublist(2, 5);

  var filledList = List.filled(50, 'hello');

  print(list.length);
  print(list.last);
  print(list.first);

  list.add(4); //push
  list.removeLast(); //pop
  list.insert(1, 1000);

  for (int n in list) {
    print(n);
  }

  list.forEach((n) => print(n));

  /// mapper
  var doubled = list.map((n) => n * 2);
  doubled.forEach(print);

  /// sum
  int sum = [1,2,3].reduce((a,b) => a+b);
  print(sum); // 6 (throws error if list is empty)
  sum = [1,2,3].fold(0,(a,b) => a+b);
  print(sum); // 6 

  /// spread operator
  var combined = [...list, ...doubled];
  combined.forEach(print);

  bool depressed = true;
  final cart = ['milk', 'eggs', if (depressed) 'Alcohol'];
  print(cart.last);
}
