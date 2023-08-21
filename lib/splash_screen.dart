import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/sign_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});




  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const  SignScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: const Center(child: Text("Classico",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700,color: Colors.white),)),

        ),
      ),
    );
  }
}
