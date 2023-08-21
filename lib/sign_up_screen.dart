import 'package:flutter/material.dart';
import 'package:untitled/dash_board.dart';
import 'package:untitled/passwordFormfield.dart';
import 'package:untitled/textFormField.dart';





class SignUpApp extends StatefulWidget {
  const SignUpApp({super.key});

  @override
  State<SignUpApp> createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
  int selectValue =1;

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();
  final phoneNameController = TextEditingController();

  final passNameController = TextEditingController();

  final confirmController = TextEditingController();
  bool isChacked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body:ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Image.asset("assets/signUp.png",height: 130,width:double.infinity,),
              const Text("Sign Up Screen",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),),
              const Text("Build Your profile by registration",
                style: TextStyle(
                    fontSize: 21,

                    color: Colors.purple
                ),
              ),
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 55,
                      width: 180,
                      child: PrimaryTextInputWidget(controller: firstNameController, hintext: "First Name", bordercolor: Colors.green,keyboardtype: TextInputType.name)),
                  SizedBox(
                      height: 55,
                      width: 180,
                      child: PrimaryTextInputWidget(controller: lastNameController, hintext: "Last Name", bordercolor: Colors.green,keyboardtype: TextInputType.name)),
                ],
              ),
              const SizedBox(height: 10,),
              PrimaryTextInputWidget(controller: emailController, hintext: "Email", bordercolor: Colors.green,keyboardtype: TextInputType.emailAddress),
              const SizedBox(height: 10,),
              PrimaryTextInputWidget(controller: phoneNameController, hintext: "Phone Number", bordercolor: Colors.green,keyboardtype: TextInputType.number),
              const SizedBox(height: 10,),
              PasswordTextInputWidget(controller: passNameController, hintext: "Enter Password", bordercolor: Colors.green,keyboardtype: TextInputType.name),
              const SizedBox(height: 10,),
              PasswordTextInputWidget(controller: confirmController, hintext: "Confirm Password", bordercolor: Colors.green,keyboardtype: TextInputType.name),
              const SizedBox(height: 10,),
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
                  title: const Text("Agree with T&C and Privacy Policy?",style: TextStyle(fontSize: 13),),
                  value: isChacked,
                  dense: true,
                  onChanged: (value){
                    isChacked = value!;
                    setState(() {

                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const DashBoard(),) , (route) => false);

                },
                  child: const Text("Registration"),),
              ),




            ],
          ),







        ));

  }
}
