void main() {
  var rectangle = Rectangle(25, 30);

  print(rectangle.area);
  const circle = Circle(radius: 50, name: 'foo');
  var point1 = Point.fromMap({'lat': 23, 'lng': 50});
  var point2 = Point.fromList([23, 50]);
}

class Rectangle {
  final int width;
  final int height;
  String? name;
  late final int area;

  // Shape(width, height) {
  //   this.width = width;
  //   this.height = height;
  // }

  Rectangle(this.width, this.height, [this.name]) {
    area = width * height;
  }
}

class Circle {
  const Circle({required int radius, String? name});
}

class Point {
  double lat = 0;
  double lng = 0;

  // Named constructor
  Point.fromMap(Map data) {
    lat = data['lat'];
    lng = data['lng'];
  }

  Point.fromList(List data) {
    lat = data[0];
    lng = data[1];
  }
}
