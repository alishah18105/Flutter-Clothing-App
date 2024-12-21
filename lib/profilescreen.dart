import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:clothingstore/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';


IconData getIconForName(String iconName) {
  switch (iconName) {
    case 'account_circle':
      return Icons.account_circle;
    case 'credit_card':
      return Icons.credit_card;
    case 'shopping_bag':
      return Icons.shopping_bag;
    case 'settings':
      return Icons.settings;
    case 'help_outline':
      return Icons.help_outline;
    case 'privacy_tip':
      return Icons.privacy_tip;
    case 'group_add':
      return Icons.group_add;
    case 'logout':
      return Icons.logout;
    default:
      return Icons.help; // Fallback if icon not found
  }
}

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
String? name = "User";


  
  @override
  @override
  void initState() {
    
    super.initState();
    if(accountDetails.isEmpty){
      name = "User";
    }

    else{
      name = accountDetails[0]["name"];
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen"),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/aim.jpg"),                  
                ), 
              ),
              SizedBox(height: 20),
              Text(name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkBlue),),
              SizedBox(height: 20,),

              Expanded(
                child: ListView.builder(
                  itemCount: profilescreen.length,
                  itemBuilder: (BuildContext, i){
                    return ListTile(
                      leading: Icon(getIconForName(profilescreen[i]["lead"]!),color: AppColors.darkBlue,), 
                      title:  Text("${profilescreen[i]["title"]}",style: TextStyle(color: AppColors.darkBlue),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20,),
                    );
                  }),
              )
            ],
          ),
        ),
      ),
            bottomNavigationBar:const BottomNav(bottomIndex: 4,),

    );
  }
}