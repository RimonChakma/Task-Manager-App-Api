import 'package:flutter/material.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                    TextFormField(decoration: AppInputDecoration("Password"),),
                    SizedBox(height: 20,),
                    TextFormField(decoration: AppInputDecoration("Conform password"),),
                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(onPressed: (){},style: AppButtonStyle(),
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
