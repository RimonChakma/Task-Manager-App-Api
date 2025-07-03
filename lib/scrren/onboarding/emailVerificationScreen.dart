import 'package:flutter/material.dart';
import 'package:task_manager_api/api/api_client.dart';

import '../../style/style.dart';

class Emailverificationscreen extends StatefulWidget {
  const Emailverificationscreen({super.key});

  @override
  State<Emailverificationscreen> createState() => _EmailverificationscreenState();
}

class _EmailverificationscreenState extends State<Emailverificationscreen> {


  Map<String,String> formValues = {"email": ""};
  bool isLoading = false;

  inputOnChange (mapKey, textValue) async {
    setState(() {
      formValues.update(mapKey, (value) => textValue,);
    });
  }

  final formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading? Center(child: CircularProgressIndicator(),):Stack(
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

                    Form(
                      key: formState,
                      child:  TextFormField(
                        onChanged: (value) {
                          inputOnChange("email", value);
                        },

                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "emailVerify is required";
                          }else{
                            return null;
                          }
                        },
                        decoration: AppInputDecoration("email address"),),),

                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(onPressed: () async {
                      if(formState.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        var result = await VerifyEmailRequest(formValues["email"]);
                        if(result == true){
                          Navigator.pushNamed(context, "/pinVerificationScreen");
                        }else{
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },style: AppButtonStyle(),
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
