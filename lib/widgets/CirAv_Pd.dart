import 'package:flutter/material.dart';

class CirAvPd extends StatelessWidget {
final Color? color;

  const CirAvPd({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: CircleAvatar(
          
                      radius: 10,  
                     backgroundColor: color,
          
          ),
          onTap: (){},
        ),
        SizedBox(width: 5,)
      ],
    );
                
  }
}