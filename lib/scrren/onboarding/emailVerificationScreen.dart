import 'package:flutter/material.dart';

import '../../style/style.dart';

class Emailverificationscreen extends StatefulWidget {
  const Emailverificationscreen({super.key});

  @override
  State<Emailverificationscreen> createState() => _EmailverificationscreenState();
}

class _EmailverificationscreenState extends State<Emailverificationscreen> {
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
                    Text("verify your email address",style: head1Text(colorDarkBlue),),
                    SizedBox(height: 5,),
                    Text("A 6 digit verification pin will sent to your email address",style: head2Text(colorLightGray),),
                    SizedBox(height: 20,),
                    TextFormField(decoration: AppInputDecoration("email address"),),
                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(onPressed: (){},style: AppButtonStyle(),
                        child: SuccessButtonChild("verify")),)
                  ],
                ),
              ),
            ),)
          ],
        )
    );
  }
}
