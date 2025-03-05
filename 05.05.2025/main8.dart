import 'dart:io';

void main()
 {
  stdout.write("Enter a year: ");
  int year = int.parse(stdin.readLineSync()!);
  bool isLeapYear = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  print("Is Leap Year: $isLeapYear");
}