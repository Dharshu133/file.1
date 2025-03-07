void main()
{
  List n = [10,5,8,20,15];
  int max = n[1];
  int secondMax = n[0];
  for(int i in n) 
  {
    if(i>max) 
    {
      secondMax=max;
      max=i;
    }
    else if(i!=max && i>secondMax)
    {
      secondMax=i;
    }
  }
  print(secondMax);
}