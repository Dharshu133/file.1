import 'dart:io'; 
void main() 
{
  print('Enter first number:');
  int num1 = int.parse(stdin.readLineSync()!);  
  print('Enter second number:');
  int num2 = int.parse(stdin.readLineSync()!);  
  print('Enter operator (+, -, *, /):');
  String operator = stdin.readLineSync()!;
  switch(operator)
  {
      case'+':
      {
        print("Addition:${num1+num2}");
        break;
      }
      case'-':
      {
        print("Subtraction:${num1-num2}");
        break;
      }
      case'*':
      {
        print("Multiple:${num1*num2}");
        break;
      }
      case'/':
      {
        print("Divide:${num1/num2}");
        break;   
      }
    default:
      {
        print("Invalid operator");
      }
  }
}