Map<int,int>valueCount(numbers)
{
  Map<int,int>valueCount={};
  for(int number in numbers)
  {
    valueCount[number]=(valueCount[number]?? 0)+1;  
  }
  return valueCount;
}
void main()
{
  List<int>numbers=[1,2,2,3,3,3,4];
  print(valueCount(numbers));
}