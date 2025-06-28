import 'package:flutter/material.dart';
import 'package:task_manager_api/style/style.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                TextFormField(decoration: AppInputDecoration("email address"),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("password"),),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(onPressed: (){},style: AppButtonStyle(),
                    child: SuccessButtonChild("login")),)
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
