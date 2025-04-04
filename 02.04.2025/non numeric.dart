import 'dart:io';
void main() 
{
  try
  {
    int n = int.parse(stdin.readLineSync()!);
    print('You entered: $n');
  } 
  catch (e)
  {
    print('Error: Invalid number format.');
  }
}
