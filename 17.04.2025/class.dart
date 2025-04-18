class Student 
{
  String name;
  int age;
  String grade;
  
  Student(this.name, this.age, this.grade);
  
  void display() 
  {
    print('Name: $name');
    print('Age: $age');
    print('Grade: $grade');
  }
}
void main() 
{
  Student student1 = Student('Dharshini', 20, 'A+');
  student1.display();
}
