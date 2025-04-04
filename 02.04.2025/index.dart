import 'dart:io';
void main()
 {
  var nums = [10, 20, 30, 40, 50];
  try 
  {
    int i = int.parse(stdin.readLineSync()!);
    print(nums[i]);
  } 
  catch (e) 
  {
    print('Error: Index out of range.');
  }
}
