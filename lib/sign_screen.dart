


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/dash_board.dart';
import 'package:untitled/passwordFormfield.dart';
import 'package:untitled/sign_up_screen.dart';
import 'package:untitled/textFormField.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  int selectValue=1;

  bool isChacked = false;
  final box = GetStorage();

  @override
  void initState() {
    _stratFatch();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(padding: const EdgeInsets.all(10), children: [
          Image.asset(
            "assets/signIn.png",
            height: 130,
            width: double.infinity,
          ),
          const Text(
            "Login Screen",
            style: TextStyle(
                fontSize: 31, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const Text(
            "Here for your account authentication",
            style: TextStyle(fontSize: 21, color: Colors.purple),
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryTextInputWidget(controller: emailController, hintext: "Email", bordercolor: Colors.green,keyboardtype: TextInputType.emailAddress),
          const SizedBox(
            height: 10,
          ),
          PasswordTextInputWidget(controller: passController, hintext: "Enter Your Password", bordercolor: Colors.blue,keyboardtype: TextInputType.name,),
          const SizedBox(
            height: 10,
          ),
          RadioListTile(
              title: const Text("Admin"),
              value: 1,
              groupValue: selectValue,
              dense: true,
              onChanged: (value){


                selectValue = value!;
                setState(() {

                });



              }),
          RadioListTile(
              title: const Text("User"),
              value: 2,
              groupValue: selectValue,
              dense: true,
              onChanged: (value){

                selectValue = value!;
                setState(() {

                });



              }),


          CheckboxListTile(
              title: const Text("Do you want to save password & email",style: TextStyle(fontSize: 13),),
              value: isChacked,
              dense: true,
              onChanged: (value){
                isChacked = value!;

                setState(() {
                  box.write('lastScreen',true);

                });
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

            },
              child: const Text("Login"),),
          ),
          
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("Don't have account?"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpApp(),));

              }, child: const Text("Sign Up")),
            ],
          )




        ]),
      ),
    );
  }

  void _stratFatch() {
    Timer(const Duration(seconds: 0), () {
      if(box.read("lastScreen")??false){
        debugPrint("LastScreen already seen");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashBoard(),), (route) => false);

      }
      else{
        debugPrint("LastScreen dont seen");
      }
    });
  }
}



