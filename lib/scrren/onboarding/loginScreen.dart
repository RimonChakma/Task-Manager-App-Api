import 'package:flutter/material.dart';
import 'package:task_manager_api/style/style.dart';
import '../../api/api_client.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool isLoading = false;

  final formState = GlobalKey<FormState>();

  void inputOnChange(String mapKey, String textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          ScreenBackground(context),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        Text("Join with us", style: head1Text(colorDarkBlue)),
                        const SizedBox(height: 5),
                        Text("Login your account", style: head2Text(colorLightGray)),
                        const SizedBox(height: 20),

                        TextFormField(
                          decoration: AppInputDecoration("email address"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email address";
                            }
                            return null;
                          },
                          onChanged: (value) => inputOnChange("email", value),
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          decoration: AppInputDecoration("password"),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          onChanged: (value) => inputOnChange("password", value),
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              var result = await LoginRequest(formValues);
                              if (result == true) {
                                print(result);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/",
                                      (route) => false,
                                );
                              }

                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: AppButtonStyle(),
                          child: SuccessButtonChild("Login"),
                        ),
                        const SizedBox(height: 30),

                        Center(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/emailVerificationScreen");
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: head3Text(colorLightGray),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account? ", style: head3Text(colorDarkBlue)),
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(context, "/registrationScreen"),
                                    child: Text("Sign Up", style: head3Text(colorGreen)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
