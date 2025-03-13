Map<String, Map<String,dynamic>>studentDetails(students) 
{
  Map<String, Map<String,dynamic>> studentDetails = {};
  for (var student in students)
  {
       studentDetails[student["name"]] = {
      "age": student["age"],
      "scores": student["scores"]
    }; 
  }
  return studentDetails;
}
void main()
{
  List<Map<String,dynamic>> students =  [  
  { "name": "Alice", "age": 20, "scores": { "Math": 90, "Science": 85 } },  
  { "name": "Bob", "age": 22, "scores": { "Math": 78, "Science": 88 } }  ,
   ];
  print(studentDetails(students));
}
