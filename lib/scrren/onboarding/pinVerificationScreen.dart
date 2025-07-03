import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_api/api/api_client.dart';
import 'package:task_manager_api/utility/utility.dart';

import '../../style/style.dart';

class PinverificationScreen extends StatefulWidget {
  const PinverificationScreen({super.key});

  @override
  State<PinverificationScreen> createState() => _PinverificationScreenState();
}

class _PinverificationScreenState extends State<PinverificationScreen> {

  Map<String,String> formValues = {"OTP":""};
  
  bool isLoading = false;
  
  inputOnChange (mapKey, textValues) async {
    setState(() {
      formValues.update(mapKey, (value) => textValues,);
    });
  }
  
  final formState = GlobalKey<FormState>();
  
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
                    Text("A 6 digit pin has been sent to your number",style: head2Text(colorLightGray),),
                    SizedBox(height: 20,),
                    Form(
                      key: formState,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        enableActiveFill: true,
                        pinTheme: AppOTPStyle(),
                        onChanged: (value) {
                          inputOnChange("OTP", value);
                        },
                        onCompleted: (value) {

                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "OTP is required";
                          }else{
                            return null;
                          }
                        },
                      ),),
                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(onPressed: () async {
                      if(formState.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        String? emailAddress = await  readData("EmailVerification");
                        var result = await VerifyOTPRequest(emailAddress, formValues["email"]);
                        if(result == true){
                          Navigator.pushNamedAndRemoveUntil(context, "/setPasswordScreen", (route) => false,);
                        }else{
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },style: AppButtonStyle(),
                        child: SuccessButtonChild("conform")),)
                  ],
                ),
              ),
            ),)
          ],
        ),
    );
  }
}
