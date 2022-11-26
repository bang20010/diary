class GetFunction{

  String getCurrentDate(){
    DateTime current = DateTime.now();
    String date = DateTime(current.year, current.month, current.day).toString();
    if(date.isNotEmpty){
        return date;
    }else{
      return "";
    }
  }
}