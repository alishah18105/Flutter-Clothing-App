import 'package:clothingstore/HomePage.dart';
import 'package:clothingstore/MyCart.dart';
import 'package:clothingstore/mywishlist.dart';
import 'package:clothingstore/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:clothingstore/utilis/app_colors.dart';


class BottomNav extends StatefulWidget {
  final bottomIndex ;
  const BottomNav({super.key, required this.bottomIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
 late int _selectedIndex ;

@override
  void initState() {
    super.initState();
    _selectedIndex = widget.bottomIndex;
  } 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if(index == 0){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
    }

    else if(index ==1){
            
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCart()));

    }

    else if( index == 2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));
    }

    else if(index == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  Profilescreen()));

    }
    

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
             color: Colors.grey.withOpacity(0.5),
    
            spreadRadius: 2,
            blurRadius: 10,
             offset: const Offset(0, 5),
    
    
          )
        ],
        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          enableFeedback: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: ""
        
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: ""
        
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: ""
        
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: ""
        
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          onTap: _onItemTapped,
          showSelectedLabels: false,  
          showUnselectedLabels: false,
           
        ),
      ),
    );
  }
}