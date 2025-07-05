import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:task_manager_api/style/style.dart';
import 'package:task_manager_api/utility/utility.dart';

var BaseUrl = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-Type": "application/json"};

Future<bool> LoginRequest (formValues) async {
  var url = Uri.parse("$BaseUrl/login");
  var postBody = jsonEncode(formValues);
  var response =await http.post(url,headers: RequestHeader,body: postBody);
  var resultBody = jsonDecode(response.body);

  if(response.statusCode == 200 && resultBody["status"] == "success"){
    successToast("success request");
    await writeUserData(resultBody);
    return true;
  }else{
    errorToast("failed try again ");
    return false;
  }
}

Future<bool> RegistrationRequest (formValues) async {
  var url = Uri.parse("$BaseUrl/registration");
  var postBody = jsonEncode(formValues);
  var response = await http.post(url,headers: RequestHeader,body: postBody);
  var resultBody = jsonDecode(response.body);

  if(response.statusCode == 200 && resultBody["status"] == "success"){
    successToast("success request");
    print(response.body);
    return true;
  }else{
    errorToast("failed try again");
    return false;
  }
}

Future<bool> VerifyEmailRequest(Email) async{
  var url=Uri.parse("$BaseUrl/RecoverVerifyEmail/$Email");
  var response= await http.get(url,headers:RequestHeader);
  var resultBody=json.decode(response.body);
  if(response.statusCode == 200 && resultBody['status']=="success"){
    await writeEmailVerification(Email);
    successToast("Request Success");
    return true;
  }
  else{
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> VerifyOTPRequest (String? Email, String? OTP) async {
  var url = Uri.parse("$BaseUrl/RecoverVerifyOTP/$Email/$OTP");
  var response = await http.get(url, headers: RequestHeader);
  print("Email: $Email, OTP: $OTP");
  print("Response: ${response.body}");

  var resultBody = json.decode(response.body);

  if (response.statusCode == 200 && resultBody["status"] == "success") {
    await writeOTPVerification(OTP ?? "");
    successToast("Request success");
    return true;
  } else {
    errorToast("Failed! Try again.");
    return false;
  }
}

Future<bool> SetPasswordRequest (formValues) async {
  var url = Uri.parse("$BaseUrl/RecoverResetPass");
  var postBody = jsonEncode(formValues);
  var response = await http.post(url, headers: RequestHeader, body: postBody);

  print("Response body: ${response.body}");
  print("Status code: ${response.statusCode}");

  var resultBody = jsonDecode(response.body);

  if (response.statusCode == 200 && resultBody["status"] == "success") {
    successToast("request success");
    return true;
  } else {
    errorToast("failed try again");
    return false;
  }
}

Future<List> TaskListRequest(Status) async {
  var url=Uri.parse("$BaseUrl}/listTaskByStatus/${Status}");
  String? token= await readUserData("token");
  var requestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(url,headers:requestHeaderWithToken);
  var resultBody=json.decode(response.body);
  if(response.statusCode==200 && resultBody['status']=="success"){
    successToast("Request Success");
    return resultBody['data'];
  }
  else{
    errorToast("Request fail ! try again");
    return [];
  }
}
