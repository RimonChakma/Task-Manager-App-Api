import 'package:flutter/material.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Padding(padding: EdgeInsets.all(30),child:Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Join with us",style: head1Text(colorDarkBlue),),
                  SizedBox(height: 5,),
                  Text("Registration an account",style: head2Text(colorLightGray),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("email address"),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("First Name"),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Last Name"),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("phone"),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("password"),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Conform password"),),
                  SizedBox(height: 20,),
                  Container(child: ElevatedButton(onPressed: (){},style: AppButtonStyle(),
                      child: SuccessButtonChild("Registration")),)
                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }
}
