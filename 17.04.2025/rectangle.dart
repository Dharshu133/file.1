class Rectangle
{
  int length;
  int width;
  
  Rectangle(this.length, this.width); 
  
  int area()
  {
    return length*width;
  }
}
void main()
{
  Rectangle rect= Rectangle(50,2);
 print('Area of rectangle: ${rect.area()}');;
}