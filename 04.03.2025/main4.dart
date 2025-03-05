String findLongestWord(String sentence) 
{
 return sentence.split(' ').reduce((a, b)=>a.length > b.length ? a : b);
}
void main()
{
  String sentence = "Have a wonderful day";
  print(findLongestWord(sentence)); 
}
