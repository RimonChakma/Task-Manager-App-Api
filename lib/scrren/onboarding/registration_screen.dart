import 'package:flutter/material.dart';
import 'package:task_manager_api/api/api_client.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  final formState = GlobalKey<FormState>();

  Map<String,String> formValues =
  {"email":"","firstName":"","lastName":"","mobile":"","photo":"","password":""};

  inputOnChange (mapKey,textValues) async {
    setState(() {
      formValues.update(mapKey, (value) => textValues,);
    });

  }

  bool isLoading = false;

  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading?Center(child: CircularProgressIndicator()):Stack(
          children: [
          ScreenBackground(context),
      Padding(padding: EdgeInsets.all(30),child:Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join with us",style: head1Text(colorDarkBlue),),
                SizedBox(height: 5,),
                Text("Registration an account",style: head2Text(colorLightGray),),
                SizedBox(height: 20,),
                Form(
                    key: formState,
                    child: Column(children: [
                      TextFormField(
                        onChanged: (value) {
                          inputOnChange("email", value);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "email is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("email address"),),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (value) {
                          inputOnChange("firstName", value);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "firstName is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("First Name"),),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (value) {
                          inputOnChange("lastName", value);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "lastName is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("Last Name"),),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (value) {
                          inputOnChange("mobile", value);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "phoneNumber is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("phone"),),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (value) {
                          inputOnChange("password", value);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "password is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("password"),),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        validator: (value) {
                          if(value== null || value.isEmpty){
                            return "confirmPassword is required";
                          }else if(value!=formValues["password"]){
                            return "password not match";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("Conform password"),),
                    ],)),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(onPressed: ()async{
                  if(formState.currentState!.validate()){
                    setState(() {
                      isLoading = true;
                    });
                    var result = await RegistrationRequest(formValues);
                    if(result == true){
                      Navigator.pushNamedAndRemoveUntil(context, "/loginScreen", (route) => false,);
                    }else{
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },style: AppButtonStyle(),
                    child: SuccessButtonChild("Registration")),)
              ],
            ),
          ),
        ),
      ),)
      ],
    ),
    );
  }
}
