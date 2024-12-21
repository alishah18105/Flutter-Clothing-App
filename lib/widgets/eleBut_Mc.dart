import 'package:flutter/material.dart';



class EleBut_Mc extends StatefulWidget {
  final String? text;
  final Color? tcolor;
  final Color? bcolor;
  final VoidCallback onPressed;

  const EleBut_Mc({super.key, required this.text, required this.tcolor, required this.bcolor, required this.onPressed, });

  @override
  State<EleBut_Mc> createState() => _EleBut_McState();
}


class _EleBut_McState extends State<EleBut_Mc> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ElevatedButton(onPressed: widget.onPressed,
      
      child: Text("${widget.text}", style: TextStyle(color: widget.tcolor,fontWeight: FontWeight.bold),), style: 
      ElevatedButton.styleFrom(
            backgroundColor: widget.bcolor,
            shadowColor: Colors.transparent, // Remove shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Rounded corners
            ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), // Adjust padding
        minimumSize: const Size(20, 20),            
           

          ),
      ),
      const SizedBox(width: 8,),

    ],);
  }
}