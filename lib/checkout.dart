import 'package:clothingstore/HomePage.dart';
import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool isCODselected = false;
  bool isOnlinePayment = false;
  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

@override
  void initState() {
    super.initState();
if (accountDetails.isNotEmpty && accountDetails[0].containsKey("email") && accountDetails[0].containsKey("name")) {
    mailController.text = accountDetails[0]["email"] ?? "";
    nameController.text = accountDetails[0]["name"] ?? "";
  } else {
    mailController.text = "abc@gmail.com";
    nameController.text = "User";
  }
   
    }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Shipping Details"),),
      body: Container(
          margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 20),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text("Full Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18),
                    ),
                  prefixIcon:  Icon(Icons.person_2_outlined,color: AppColors.darkBlue),
                  contentPadding:  const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Email",
                  ),
            
                ),
               const  SizedBox(height: 10,),
          
              const Text("Email", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
             const SizedBox(height: 5,),
              TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18),
                    ),
                  prefixIcon:  Icon(Icons.email_outlined,color: AppColors.darkBlue),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Email",
                  ),
            
                ),
               const  SizedBox(height: 10,),
               const Text("Phone Number", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
               const SizedBox(height: 5,),
               IntlPhoneField(
                keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18),
                    ),
                  prefixIcon:  Icon(Icons.call,color: AppColors.darkBlue),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Phone Number",
                  ),
            ),
          
           const Text("Select City", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
             const SizedBox(height: 5,),
              TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18),
                    ),
                  prefixIcon:  Icon(Icons.location_on_outlined,color: AppColors.darkBlue),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "City",
                  ),
            
                ),
                  const  SizedBox(height: 10,),
          
              const  Text("Street Address", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
             const SizedBox(height: 5,),
              TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18),
                    ),
                  prefixIcon:  Icon(Icons.location_on_outlined,color: AppColors.darkBlue),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Street Adress",
                  ),
            
                ),
               const  SizedBox(height: 40,),
          
              Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isCODselected = !isCODselected;
                          isOnlinePayment = false;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isCODselected? AppColors.darkBlue :Colors.transparent,
                          border: Border.all(
                            color: isCODselected ? Colors.transparent : AppColors.darkBlue,
                            width: 3,
                          )
                      
                        ),
                        child: Image.asset("assets/images/cod.png", fit: BoxFit.contain,),
                      ),
                    ),
                  const  SizedBox(width: 30,),
          
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isOnlinePayment = !isOnlinePayment;
                          isCODselected = false;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          color: isOnlinePayment? AppColors.darkBlue : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isOnlinePayment ? Colors.transparent : AppColors.darkBlue,
                          width: 3,
                          )
                        ),
                      
                          child: Image.asset("assets/images/OnlinePay1.jpg",fit: BoxFit.cover,)                  ),
                    )
                  ],
                 ),
               ),
          
                const  SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(onPressed: () {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.darkBlue, size: 60),
            const SizedBox(height: 20),
           const Text(
              'Your order has been confirmed!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage()));                 },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text('Back to Home', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
, 
                    
                    child:  Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical:11),
                    backgroundColor: AppColors.darkBlue,
                  ),
                    )
                    ),
                  
          
              
            ],
          ),
        ),
      ),
    );
  }
}