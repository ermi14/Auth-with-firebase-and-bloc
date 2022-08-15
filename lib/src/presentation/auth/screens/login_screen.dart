import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:test_task/src/presentation/auth/screens/forgot_password_screen.dart';
import 'package:test_task/src/presentation/auth/screens/signup_screen.dart';
import 'package:test_task/src/presentation/home/home_screen.dart';
import '../../../core/utils/decorations.dart';
import '../../../core/utils/validations.dart';
import '../../../di/injector.dart';
import '../blocs/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc loginBloc = sl<LoginBloc>();
  final _formKey = GlobalKey<FormState>();

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
                        "Hello there!",
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
                        "Welcome to this demo app",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    /// Email text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        controller: emailController,
                        validator: emailValidator,
                        keyboardType: TextInputType.emailAddress,
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
                          controller: passwordController,
                          validator: passwordValidator,
                          obscureText: true,
                          decoration: inputDecoration("Password"),
                        ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    /// forgot password text button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName);
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    /// Login in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        bloc: loginBloc,
                        listener: (context, state) {
                          if (state is LoginError) {
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
                          } else if (state is LoginSuccess) {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                if (_formKey.currentState?.validate() == true) {
                                  loginBloc.add(UserLoginEvent(
                                      email: emailController.text.trim(),
                                      password:
                                          passwordController.text.trim()));
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    "Login",
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

                    /// Sign up button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignupScreen.routeName);
                            },
                            child: const Text(
                              "Signup Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 24,
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
    super.dispose();
  }
}
