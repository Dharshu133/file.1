String removeDuplicates(String word)
{
  Set<String> seen = {};
  String result = '';
  for (int i = 0; i < word.length; i++) 
  {
    String char = word[i];
    if (!seen.contains(char))
    {
      seen.add(char);
      result += char;
    }
  }
  return result;
}
void main() 
{
  String word = "system";
  print(removeDuplicates(word));  
}

  