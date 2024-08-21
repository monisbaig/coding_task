// ignore_for_file: use_build_context_synchronously

import 'package:coding_task/screens/auth/login.dart';
import 'package:coding_task/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:coding_task/shared/constants/app_colors.dart';
import 'package:coding_task/shared/constants/contants.dart';
import 'package:coding_task/shared/constants/photo_links.dart';
import 'package:coding_task/shared/widgets/custom_button.dart';
import 'package:coding_task/shared/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    'Welcome!',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 41,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            kgap80,
            CustomTextField(
              controller:
                  TextEditingController(text: user?.email ?? 'No Email'),
              hintText: 'Email',
              iconLink: emailLink,
              enabled: false,
            ),
            kgap60,
            CustomButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                pushAndRemove(context, const Login());
              },
              buttonText: 'Logout',
            ),
            kgap60,
          ],
        ),
      ),
    );
  }
}
