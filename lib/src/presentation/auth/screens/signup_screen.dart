import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../core/utils/decorations.dart';
import '../../../core/utils/validations.dart';
import '../../../di/injector.dart';
import '../../home/home_screen.dart';
import '../blocs/signup/signup_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String routeName = "/signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignupBloc signupBloc = sl<SignupBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Greeting text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Hello Again!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Please create an account to use our services.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    /// User name text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: usernameController,
                          validator: usernameValidator,
                          decoration: inputDecoration("Username")
                        ),
                      ),
                  
                    const SizedBox(
                      height: 14,
                    ),

                    /// Email text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: emailValidator,
                          decoration: inputDecoration("Email"),
                        ),
                      
                    ),
                    const SizedBox(
                      height: 14,
                    ),

                    /// password text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: passwordValidator,
                          decoration: inputDecoration("Password")
                        ),
                      ),
                  
                    const SizedBox(
                      height: 14,
                    ),

                    /// Confirm password text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          validator: passwordValidator,
                          decoration: inputDecoration("Confirm Password"),
                        ),
                      ),
                    
                    const SizedBox(
                      height: 14,
                    ),

                    /// Sign up button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: BlocConsumer<SignupBloc, SignupState>(
                        bloc: signupBloc,
                        listener: (context, state) {
                          if (state is SignupError) {
                            var snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Oops!',
                                message: state.message
                                    .replaceAll(RegExp(r'Exception: '), ""),
                                contentType: ContentType.failure,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (state is SignupSuccess) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                HomeScreen.routeName, (route) => false);
                          }
                        },
                        builder: (context, state) {
                          if (state is SignupLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                if (_formKey.currentState?.validate() == true) {
                                  if (passwordController.text.trim() ==
                                      confirmPasswordController.text.trim()) {
                                    signupBloc.add(UserSignupEvent(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim()));
                                  } else {
                                    var snackBar = SnackBar(
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Oops!',
                                        message: "Passwords don't match",
                                        contentType: ContentType.failure,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    /// Login button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Login Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ))
                      ],
                    ),

                    const SizedBox(
                      height: 32,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
