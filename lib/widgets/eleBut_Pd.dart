import 'package:clothingstore/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class ElebutPd extends StatefulWidget {
  final String text;
  final int index;
  final Function(int) onPressed;
  final int isSelected;

  const ElebutPd({
    super.key,
    required this.text,
    required this.index,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  State<ElebutPd> createState() => _EleButtHpState();
}

class _EleButtHpState extends State<ElebutPd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onPressed(widget.index);
          },
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isSelected == widget.index ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isSelected == widget.index ? AppColors.darkBlue : Colors.transparent,
            shadowColor: Colors.transparent,
            side: BorderSide(color: AppColors.darkBlue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size(10, 30),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
