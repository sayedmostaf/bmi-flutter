import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/data/models/gender.dart';
import 'package:bmi/view/theme/typography.dart';
import 'package:bmi/view/widgets/curve.dart';
import 'package:flutter/material.dart';

class GenderSelectionTile extends StatelessWidget {
  const GenderSelectionTile(
      {super.key,
      required this.gender,
      required this.onPressed,
      this.isSelected = false});
  final Gender gender;
  final bool? isSelected;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: CustomCurvePath(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(
                  microseconds: 800,
                ),
                height: isSelected! ? size.height * .16 : size.height * 0.14,
                width: isSelected! ? size.width * .45 : size.width * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected! ? Colors.white : grey,
                  ),
                  color: gender.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset('assets/${gender.image}'),
                    isSelected!
                        ? const Positioned(
                            top: 5,
                            right: 5,
                            child: Icon(
                              Icons.check_box_sharp,
                              color: primary,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            gender.gender!,
            style: isSelected!
                ? CustomTypography.labelNormalBold
                : CustomTypography.labelNormal,
          )
        ],
      ),
    );
  }
}
