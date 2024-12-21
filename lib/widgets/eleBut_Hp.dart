import 'package:clothingstore/HomePage.dart';
import 'package:clothingstore/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class EleButtHp extends StatefulWidget {
  final String? text;
  final int? index;
  
  final Function onPressed;


   EleButtHp({super.key, required this.text, required this.index, required this.onPressed,});

  @override
  State<EleButtHp> createState() => _EleButtHpState();
}

class _EleButtHpState extends State<EleButtHp> {

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ElevatedButton(onPressed: (){
        
        widget.onPressed(widget.index);

      }, child: Text("${widget.text}", style: TextStyle(color: isSelected == widget.index? AppColors.white: AppColors.darkBlue),), style: 
      ElevatedButton.styleFrom(
            backgroundColor: isSelected == widget.index ? AppColors.darkBlue :Colors.transparent,
            shadowColor: Colors.transparent, 
            side: BorderSide(color: Color(0xFF051054), width: 2), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), 
            ),
          ),
      ),
      const SizedBox(width: 8,),

    ],);
  }
}