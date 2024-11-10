class Validation{
  static nameValidator({required String nameValue}){
    if(nameValue.isEmpty){
      return "Please Enter Name";
    }
    return null;
  }
}