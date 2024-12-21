import 'package:flutter/material.dart';

class CaHp extends StatelessWidget {

final String? image ;

  const CaHp({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(

                  radius: 30,
                  
                  backgroundColor: Colors.grey.withOpacity(0.1),

                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset("assets/images/$image", fit: BoxFit.cover,)),);
                
  }
}