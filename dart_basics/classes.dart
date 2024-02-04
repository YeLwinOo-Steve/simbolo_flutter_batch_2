void main() {
  Person thing = new Person(55);
  thing.id;
  thing.doStuff();
  Person.walk();
}

class Person {
  int id;

  Person(this.id);

  doStuff() {
    print('Hello my ID is $id');
  }

  static walk() {
    print("I can walk.");
  }
}
