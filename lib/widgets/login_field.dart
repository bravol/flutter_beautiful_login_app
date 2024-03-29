import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/pallete.dart';

class LoginField extends StatelessWidget {
  const LoginField(
      {super.key, required this.hintiText, required this.controller});
  final String hintiText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 376,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.gradient2, width: 3),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: hintiText,
        ),
      ),
    );
  }
}
