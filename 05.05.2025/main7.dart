int sumOfDigits(int n) 
{
  int sum = 0;
  while (n > 0) 
  {
    sum+=n%10; 
    n~/=10; 
  }
  return sum;
}
void main() 
{
  int n = 12345;
  print(sumOfDigits(n));
}
