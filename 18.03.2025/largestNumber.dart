int findLargestNumber(List<List<int>>nestedList)
{
  int largestNumber=nestedList[0][0];
  for(var sublist in nestedList)
  {
    for(var num in sublist)
    {
      if(num>largestNumber)
      {
        largestNumber=num;
      }
    }
  }
  return largestNumber;
}
void main()
{
  List<List<int>>nestedList=[
    [3,8,2],
    [4,5],
    [9,1,7]
  ];
  print(findLargestNumber(nestedList));
}