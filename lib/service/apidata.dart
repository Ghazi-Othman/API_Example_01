// ignore_for_file: avoid_print

import 'package:flutter_application_1/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiData {
/*
  Sure I could make the url like : https://jsonplaceholder.typicode.com/users .... but in case like 
  I should send parameters with the url ..... it's a good way to make the constant part of the url 
  in one var and the rest of it in another vars 

  I used the http library to send request to the API and get resopnse 
  There is another library which is Dio 
  You can learn more about it here : https://pub.dev/packages/dio
  
*/

  String baseUrl = "https://jsonplaceholder.typicode.com";
  String endPoints = "/users";

/*
  Now ..... the function getUserData ... the return type is Future because our data will late to arrive 
  and List<UserModeL> because that is the type of our json response 
  I made a model to convert the json response 
  I used try and catch just in case any error will apper 
  
  The get function in http library ... take a parameter of type Uri 
  so i made a var url and parse the string (baseUrl+endPoints) .... the parse function take a string 

  I used await with the response ..... then I convert it to a (List of Objects) of my model (UserModel) and returned it in case no error happend

  That's all about Api file

*/

  Future<List<UserModel>?> getUserData() async {
    try {
      var url = Uri.parse(baseUrl + endPoints);
      var response = (await http.get(url));
      List<UserModel> result = userModelFromJson(response.body);
      if (response.statusCode == 200) {
        return result;
      } 
    } catch (e) {
      throw "Something wrong : $e";
    }
    return null ; 
  }
}
