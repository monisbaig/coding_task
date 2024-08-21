import 'package:coding_task/cubits/login_cubit/login_state.dart';
import 'package:coding_task/screens/home/home.dart';
import 'package:coding_task/shared/utils/navigation.dart';
import 'package:coding_task/shared/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_task/shared/constants/app_colors.dart';
import 'package:coding_task/shared/constants/contants.dart';
import 'package:coding_task/shared/constants/photo_links.dart';
import 'package:coding_task/shared/widgets/custom_button.dart';
import 'package:coding_task/shared/widgets/custom_textfield.dart';
import 'package:form_validation/form_validation.dart';
import 'package:coding_task/cubits/login_cubit/login_cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            showCustomSnackBar(context, state.errorMessage, isError: true);
          } else if (state is LoginSuccess) {
            showCustomSnackBar(context, 'Logged in Successfully');
            pushAndRemove(context, const Home());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kgap40,
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: gradientColor1.withOpacity(0.01),
                                  blurRadius: 50,
                                  spreadRadius: 30,
                                ),
                                BoxShadow(
                                  color: gradientColor2.withOpacity(0.01),
                                  blurRadius: 80,
                                  spreadRadius: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            'Log in!',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 41,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kgap100,
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      iconLink: emailLink,
                      validator: (value) {
                        final validator = Validator(
                          validators: [
                            const RequiredValidator(),
                            const EmailValidator(),
                          ],
                        );

                        return validator.validate(
                          label: 'Email',
                          value: value,
                        );
                      },
                    ),
                    kgap10,
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      iconLink: passwordLink,
                      obscureText: obscureText,
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      validator: (value) {
                        final validator = Validator(
                          validators: [
                            const RequiredValidator(),
                            const MinLengthValidator(length: 6),
                          ],
                        );

                        return validator.validate(
                          label: 'Password',
                          value: value,
                        );
                      },
                    ),
                    kgap60,
                    if (state is LoginLoading)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context
                                .read<LoginCubit>()
                                .loginWithEmailAndPassword(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                          }
                        },
                        buttonText: 'Login',
                      ),
                    kgap60,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
