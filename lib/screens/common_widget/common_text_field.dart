import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;

  final TextInputType? keyboardType;

  const CommonTextField({
    super.key,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: '请输入',
          isCollapsed: true,
          fillColor: Color(0xFFF7F7F7),
          hintStyle: TextStyle(
            fontSize: 12,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          )),
    );
  }
}
