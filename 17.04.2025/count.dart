class Counter 
{
  static int count = 0;
  Counter() 
  {
    count++;
    print('Object count: $count');
  }
}
void main() 
{
  Counter(); 
  Counter(); 
  Counter();
}