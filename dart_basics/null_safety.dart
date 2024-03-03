void main() {
  String? hello;
  
//   late String hi;
//   print(hi);
  
  
  
  

  
//   print(hello ?? 'Empty String');
// print(hello!);
  
  
//   Person person = Person('ye');
  
  Person? person;
  
 
  print(person?.name ?? 'Default name');
  
}

class Person{
  String name;
  Person(this.name);
}







// dart 2.12 
// 
// ? - null ဖြစ်ခွင့်ပေးတယ်
// ?? - null ဖြစ်သလား ?? default value
// ! - null ဖြစ်ခွင့်မရှိဘူး


// ?. - 


// late keyword