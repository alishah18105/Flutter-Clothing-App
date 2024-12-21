import 'package:clothingstore/HomePage.dart';
import 'package:clothingstore/SignUpScreen.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen
({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool _obscureText = true;
  String? text = "";
   TextEditingController mail = TextEditingController();
    TextEditingController pass = TextEditingController();


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome",style: TextStyle(color: Color(0xFF051054), fontSize: 50, fontWeight: FontWeight.w800),),
              const Text("Back",style: TextStyle(color: Color(0xFF051054), fontSize: 50, fontWeight: FontWeight.w800),),

              const Text("Hey! Good to see you again", style: TextStyle(color: Color(0xFF051054),fontWeight: FontWeight.w600),),
              const SizedBox(height: 50),
          
              TextField(
                controller: mail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon:   Icon(Icons.email_outlined,color: AppColors.darkBlue,),
                
                hintText: "Email",
                ),
          
              ),
              const SizedBox(height: 10,),
              
              TextField(
                controller: pass,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon:  Icon(Icons.key,color: AppColors.darkBlue),
                suffixIcon: IconButton(onPressed: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
                }, icon: Icon(_obscureText ? Icons.visibility_off: Icons.visibility,color: AppColors.darkBlue)),
                hintText: "Password",
                ),
                  
              ), 
              const SizedBox(height: 5,),
              Center(child: Text("$text", style: const TextStyle(color: Colors.red),)),

              const SizedBox(height: 5,),
               Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: [
                  Checkbox(value: isChecked, onChanged: (bool? value){
                    setState(() {
                      isChecked = value ?? false;
                    });
                  }),
                  const Text("Remember Me"),
                  const SizedBox(width: 35,),
                  TextButton(onPressed: (){}, child: const Text("Forgot Password?"),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    if(mail.text.isEmpty || pass.text.isEmpty){
                      text = "Input field can't be empty";
                    }
                    else{ text = "";
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage() ),);  
                    }

                  });
                  
                }, child: Text("Sign In",style: TextStyle(color: AppColors.white,fontSize: 15),), style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical:11),
                  backgroundColor: AppColors.darkBlue,
                ),),
              ),
              const SizedBox(height: 20,),
              const Center(child: Text("Or sign up with")),
    const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.apple, size:40,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: FaIcon(FontAwesomeIcons.google, size: 30,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.facebook, size: 40,),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                 const  Text("Don't have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                }, child: const Text("Sign Up") )]
                )

            ],
            
          ),
        ),
      ),
    );
  }
}