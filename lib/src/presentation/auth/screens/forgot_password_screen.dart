import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:test_task/src/core/utils/validations.dart';
import 'package:test_task/src/di/injector.dart';
import 'package:test_task/src/presentation/auth/blocs/forgot_password/forgot_password_bloc.dart';

import '../../../core/utils/decorations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = "/forgot_password_screen";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  ForgotPasswordBloc forgotPasswordBloc = sl<ForgotPasswordBloc>();
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
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Please provide your email and we will send you a link to reset your password",
                  style: TextStyle(
                    fontSize: 16,
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: emailValidator,
                    decoration: inputDecoration("Email")
                  ),
                ),
            
              const SizedBox(
                height: 20,
              ),

              /// Request reset code button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                  bloc: forgotPasswordBloc,
                  listener: (context, state) {
                    if (state is ForgotPasswordError) {
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
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (state is ForgotPasswordSuccess) {
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Success!',
                          message: "Reset password link sent to the email provided. Check inside your spam."
                              .replaceAll(RegExp(r'Exception: '), ""),
                          contentType: ContentType.success,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgotPasswordLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            forgotPasswordBloc.add(UserForgotPasswordEvent(
                                email: emailController.text.trim()));
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Request reset code",
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
                height: 32,
              ),
            ]),
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
