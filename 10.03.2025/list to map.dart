Map<String, int> nameLength(names)
{
  Map<String, int>nameLength = {};
  for (String name in names)//loop the names list
  {
    nameLength[name]= name.length;//assign length of names value
  }
  return nameLength;
}
void main() 
{
  List<String> names = ["Alice", "Bob", "Charlie"];
  print(nameLength(names));
}