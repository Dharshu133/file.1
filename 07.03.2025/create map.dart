void main() 
{
  List fruits= ["apple", "banana", "apricot", "blueberry", "cherry"];
  Map<String,List<String>>result = {};
  for (var a in fruits) 
  {
    String firstLetter = a[0];
    result[firstLetter]=[a];
  }
  print(result.toString().replaceAll(",", "\n"));
}