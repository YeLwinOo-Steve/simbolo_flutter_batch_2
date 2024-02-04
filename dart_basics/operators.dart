void main() {
  // Basic Math

  1 + 2 - 3 * 4 / 5;

  // Logic
  1 == 1;
  1 < 2;
  (1 >= 1) || ('a' == 'b');

  int x = 1;
  x++; // x = x + 1
  x--; // x = x - 1

  // Assignment
  String? name;
  name ??= 'Guest';

  // Ternary
  String color = 'blue';
  var isThisBlue = color == 'blue' ? 'Yep, blue it is' : 'Nah, it is not blue';

  // Typecast
  var number = 23 as String;
  number is String; // true
}
