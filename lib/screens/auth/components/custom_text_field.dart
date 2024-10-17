// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChange,
    this.hintText,
    this.obscure = false,
  });

  final Function(String)? onChange;
  final String? hintText;
  final bool obscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure ? _isObscured : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        if (widget.hintText?.toLowerCase() == 'email') {
          final emailRegex =
              RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }

        return null;
      },
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kSignUpColor.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kSignUpColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kSignUpColor),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kSignUpColor.withOpacity(0.6),
          fontSize: 16,
        ),
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: kSignUpColor.withOpacity(0.7),
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: kSignUpColor,
      ),
    );
  }
}
