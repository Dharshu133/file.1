String findMostOccurringCharacter(String word)
{
  Map<String, int> charCount = {};
  for (int i = 0; i < word.length; i++) 
  {
    String char = word[i];
    charCount[char] = (charCount[char] ?? 0) + 1;
  }
  String mostOccurringChar = '';
  int maxCount = 0;
  charCount.forEach((char, count) 
  {
      if (count > maxCount) 
      {
        maxCount = count;
        mostOccurringChar = char;
      }
  });
  return mostOccurringChar;
}
void main()
{
  String word = "Technology";
  print(findMostOccurringCharacter(word));  
}