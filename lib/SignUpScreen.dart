//import 'package:clothingstore/HomePage.dart';
import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/loginScreen.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen
({super.key});

  @override
  
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool _obscureText = true;
  bool _obscureText2 = true;

 TextEditingController mail = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
   TextEditingController cpass = TextEditingController();
  String? text = "" ;

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
               Text("Sign Up",style: TextStyle(color: AppColors.darkBlue , fontSize: 50, fontWeight: FontWeight.w800),),
                Text("Hello! Let's join with us", style: TextStyle(color: AppColors.darkBlue ,fontWeight: FontWeight.w600),),
              const SizedBox(height: 40),
          
              TextField(
                controller: mail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon:  Icon(Icons.email_outlined,color: AppColors.darkBlue),
                hintText: "Email",
                ),
          
              ),
             const  SizedBox(height: 10,),

              TextField(
                  controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon:  Icon(Icons.person_2_outlined,color: AppColors.darkBlue),
                hintText: "Full Name",
                ),
          
              ), const  SizedBox(height: 10,),
        
              TextField(
                  controller: pass,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon: Icon(Icons.key,color: AppColors.darkBlue),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,color: AppColors.darkBlue)),
                hintText: "Password",
                ),
          
              ),
 const SizedBox(height: 10,),
        
              TextField(
                controller: cpass,
                obscureText: _obscureText2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                prefixIcon:  Icon(Icons.key,color:AppColors.darkBlue,),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                }, icon: Icon(_obscureText2 ? Icons.visibility_off : Icons.visibility,color: AppColors.darkBlue)),
                hintText: "Confirm Password",
                ),
          
              ),

            Center(child: Text("$text", style: TextStyle(color: Colors.red),)),

              const SizedBox(height: 10,),
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
                 const  Text("Agree with"),
                  TextButton(onPressed: (){}, child: const Text("Terms & Conditions"),
                  ),
                ],
              ),
             const  SizedBox(height: 10,),
              Center(
                child: ElevatedButton(onPressed: (){
                
                setState(() {
                  if(name.text.isEmpty  ||  mail.text.isEmpty || pass.text.isEmpty || cpass.text.isEmpty){
                 
                  text = "Input field can't be empty";
                 
                }

                 else if(pass.text != cpass.text){
                    text = "Password doesn't match";
                }

                else{
                  
                  accountDetails.add({
                    "name" : name.text,
                    "email" : mail.text,


                  });
                                      text = "";
                    
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.darkBlue,
                      content: Text("Sign up Successfully", style: TextStyle(color: AppColors.white),),
                      action: SnackBarAction(label: "undo",textColor:AppColors.white, onPressed: (){}), 
                    )
                  );
                }
                });
                
                }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 15),), style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical:11),
                  backgroundColor: AppColors.darkBlue,
                ),),
              ),
             const  SizedBox(height: 20,),
             const  Center(child: Text("Or sign up with")),
   const  SizedBox(height: 20),
               const  Row(
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
                 const  Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                }, child: const Text("Sign In") )]
                )

            ],
            
          ),
        ),
      ),
    );
  }
}