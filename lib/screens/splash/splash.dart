// ignore_for_file: use_build_context_synchronously

import 'package:coding_task/shared/constants/app_colors.dart';
import 'package:coding_task/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coding_task/screens/auth/login.dart';
import 'package:coding_task/screens/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      pushAndRemove(context, const Home());
    } else {
      pushAndRemove(context, const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: CircularProgressIndicator(), // Or your custom splash content
      ),
    );
  }
}
