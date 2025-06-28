import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style/style.dart';

class PinverificationScreen extends StatefulWidget {
  const PinverificationScreen({super.key});

  @override
  State<PinverificationScreen> createState() => _PinverificationScreenState();
}

class _PinverificationScreenState extends State<PinverificationScreen> {
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
                    Text("A 6 digit pin has been sent to your number",style: head2Text(colorLightGray),),
                    SizedBox(height: 20,),
                    PinCodeTextField(
                        appContext: context,
                        length: 6,
                      enableActiveFill: true,
                      pinTheme: AppOTPStyle(),
                      onChanged: (value) {

                      },
                      onCompleted: (value) {

                      },
                    ),
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
