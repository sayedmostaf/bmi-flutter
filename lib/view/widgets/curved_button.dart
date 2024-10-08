import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/widgets/curve.dart';
import 'package:flutter/material.dart';

class CurvedButton extends StatelessWidget {
  const CurvedButton(
      {super.key,
      this.onPressed,
      this.text = "Next",
      this.color = primary,
      this.icon = Icons.arrow_forward});
  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipPath(
        clipper: CustomCurvePath(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          height: 46,
          width: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text!,
                style: const TextStyle(color: Colors.white),
              ),
              Icon(
                icon!,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
