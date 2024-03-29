import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/pallete.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.onPressed,
      this.horizontalPadding = 90});
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Pallete.whiteColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 25, horizontal: horizontalPadding),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
