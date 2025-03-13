List<int>flattenList(nestedList) 
{
  List<int>flattenList=[];
  for (var innerList in nestedList) {
    flattenList.addAll(innerList);
  }
  return flattenList;
}
void main()
{
  List<List<int>> nestedList = [
    [1, 2, 3],[4, 5],[6, 7, 8, 9]
  ];
  List<int>flattenedList = flattenList(nestedList);
  print(flattenedList);  
}
