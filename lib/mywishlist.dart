import 'package:clothingstore/data/data.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:clothingstore/widgets/bottom_navigation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
final currencyFormat = NumberFormat.currency(locale: 'en_PK', symbol: 'PKR ');

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Wish List", style: TextStyle(color: AppColors.darkBlue),)),
      ),

      body: ListView.builder(
        
        itemCount: fav.length,
        itemBuilder: (BuildContext, index){
          return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Slidable(
                    endActionPane: ActionPane(motion: const ScrollMotion(), 
                    children: [
                    SlidableAction(onPressed: (context){
                      setState(() {
                        fav.removeAt(index);
                      }
                      );  
                    },
                    backgroundColor: AppColors.darkBlue,
                    foregroundColor: AppColors.white,
                    icon: Icons.delete,
                    
                    )
                    ]),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Image.asset(
                            "assets/images/${fav[index]["image"]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        "${fav[index]["pdDetail"]}",
                        style: TextStyle(color: AppColors.darkBlue),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size: XL", 
                            style: TextStyle(color: AppColors.grey, fontSize: 10),
                          ),
                          Text(
                            currencyFormat.format(fav[index]["price"]),
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      
                        ),
                      ),
                ],
                    ),
                  );
        },           
      ),
                    
          
      
      bottomNavigationBar: const BottomNav(bottomIndex: 2,),

    );
  }
}