class Circle
{
  static const double pi = 3.14; 
  double radius;
  
  Circle(this.radius);
  
  double area()
  {
    return pi * radius * radius;
  }
}
void main() 
{
  Circle circle1 = Circle(5);
  print('Area of the circle: ${circle1.area()}');
}
