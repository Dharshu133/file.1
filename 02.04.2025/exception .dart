import 'dart:io';
void main() 
{
  try 
  {
    print('Enter numerator: ');
    int a = int.parse(stdin.readLineSync()!);
    print('Enter denominator: ');
    int b = int.parse(stdin.readLineSync()!);
    print('Result: ${a / b}');
  } 
  catch (e)
  {
    print('Error: Division by zero is not allowed.');
  }
}
