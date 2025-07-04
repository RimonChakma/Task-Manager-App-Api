import 'package:flutter/material.dart';
import 'package:task_manager_api/api/api_client.dart';
import 'package:task_manager_api/utility/utility.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {

  final formState = GlobalKey<FormState>();

  Map<String,String> formValues = {"email":"","OTP":"","password":""};

  bool isLoading = false;
  String conformPassword = "";

  @override
  void initState() {
    callStoreData();
    super.initState();
  }

  callStoreData () async {
   String? OTP =await readUserData("otp");
   String? email  = await readUserData("emailVerification");

   if (email != null) {
     inputOnChange("email", email);
   }
   if (OTP != null) {
     inputOnChange("OTP", OTP);
   }


  }

  inputOnChange(String mapKey, String? textValue) async {
    if (textValue == null) return;
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading?Center(child: CircularProgressIndicator(),):Stack(
          children: [
            ScreenBackground(context),
            Padding(padding: EdgeInsets.all(30),child:Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Password",style: head1Text(colorDarkBlue),),
                    SizedBox(height: 5,),
                    Text("Minimum length password 8 character with letter and number combination",style: head2Text(colorLightGray),),
                    SizedBox(height: 20,),
                    Form(
                        key: formState,
                        child: Column(children: [
                          TextFormField(
                            onChanged: (value) {
                              inputOnChange("password", value);
                            },
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "password is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: AppInputDecoration("Password"),),
                          SizedBox(height: 20,),
                          TextFormField(
                            onChanged: (value) {
                              conformPassword = value;
                            },
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "conform password is empty";
                              }else if(value!= formValues["password"]){
                                return "password not match";
                              }null;
                            },
                            decoration: AppInputDecoration("Conform password"),),
                        ],)),
                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(onPressed: () async {
                      if(formState.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        var result = await  SetPasswordRequest(formValues);
                        if(result == true){
                          Navigator.pushNamedAndRemoveUntil(context, "/loginScreen", (route) => false,);
                        }
                      }
                    },style: AppButtonStyle(),
                        child: SuccessButtonChild("conform")),)
                  ],
                ),
              ),
            ),)
          ],
        )
    );
  }
}
