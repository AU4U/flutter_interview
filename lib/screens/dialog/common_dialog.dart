import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/common_widget/widget_extension.dart';


Future showCommonDialog(
  BuildContext context, {
  required Widget content,
  required String title,
  required Function action,
}) {
  return showDialog(
    context: context,
    builder: (
      BuildContext context,
    ) {
      return AlertDialog(
        surfaceTintColor: const Color(0xFFFFFFFF),
        title: Center(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )),
        content: Container(

          child: Wrap(
            children: [
              Column(
                children: [
                  Container(
                    child: content,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF377DF7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '确定',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ).wrapGestureDetector(
                    onTap: () {
                      action();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
