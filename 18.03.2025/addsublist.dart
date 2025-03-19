List<int>findSumOfSublist(List<List<int>> nestedList) 
{
  List<int> result = [];
  for (var sublist in nestedList)
  {
    int sum = 0;
    for (var element in sublist)
    {
      sum += element;
    }
    result.add(sum);
  }
  return result;
}
void main() 
{
  List<List<int>> nestedList = [
    [1, 2, 3],
    [4, 5],
    [6, 7, 8, 9]
  ];
  print(findSumOfSublist(nestedList)); 
}