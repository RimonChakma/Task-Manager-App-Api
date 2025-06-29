import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:task_manager_api/style/style.dart';

var BaseUrl = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-Type": "application/json"};

Future<bool> LoginRequest (formValues) async {
  var url = Uri.parse("$BaseUrl/login");
  var postBody = jsonEncode(formValues);
  var response =await http.post(url,headers: RequestHeader,body: postBody);
  var resultBody = jsonDecode(response.body);

  if(response.statusCode == 200 && resultBody["status"] == "success"){
    successToast("success request");
    return true;
  }else{
    errorToast("failed try again ");
    return false;
  }
}