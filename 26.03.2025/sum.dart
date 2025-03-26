import 'dart:io';  
void main() 
{
  print('Enter a number:');
  int n = int.parse(stdin.readLineSync()!);  
  int sum = 0;  
  while(n>0) 
  {
    sum += n%10;  
    n ~/= 10;         
  }
   print('Sum of digits: $sum');
}