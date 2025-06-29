import 'package:flutter/material.dart';
import 'package:task_manager_api/scrren/onboarding/registration_screen.dart';
import 'package:task_manager_api/style/style.dart';

import '../../api/api_client.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  Map<String,String> formValues = {"email":"","password":""};
  bool isLoading = false;

  inputOnChange (mapKey,textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue,);
    });
  }

  final formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? Center(child: CircularProgressIndicator(),):
      Stack(
        children: [
          ScreenBackground(context),
          Padding(padding: EdgeInsets.all(30),child:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join with us",style: head1Text(colorDarkBlue),),
                SizedBox(height: 5,),
                Text("Login your account",style: head2Text(colorLightGray),),
                SizedBox(height: 20,),

                Form(
                    key: formState,
                    child: Column(children: [
                      TextFormField(

                        onChanged: (textValue) {
                          inputOnChange("email", textValue);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "please enter your email address";
                          }
                        },
                        decoration: AppInputDecoration("email address"),),
                      SizedBox(height: 20,),


                      TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "please enter your password";
                          }
                        },
                        onChanged: (textValue) {
                          inputOnChange("password", textValue);
                        },
                        decoration: AppInputDecoration("password"),),
                      SizedBox(height: 20,),

                      Container(child: ElevatedButton(
                          onPressed: () async{
                            if(formState.currentState!.validate()){
                              setState(() {
                                isLoading = true;
                              });

                              var result = await LoginRequest(formValues);
                              if(result == true){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },style: AppButtonStyle(),
                          child: SuccessButtonChild("login")),)
                    ],)),
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
