import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
import '../../models/model.dart';
import '../common_widget/common_text_field.dart';

void showChildCareDialog(
  BuildContext context, {
  required MapEntry<String, String> entry,
  required String childCareLeaveKey,
  required Map<String, String> childCareLeaveMap,
  required Model model,
}) {
  TextEditingController controller1 = TextEditingController(text: entry.key);
  TextEditingController controller2 = TextEditingController(text: entry.value);

  showCommonDialog(
    context,
    title: childCareLeaveKey,
    action: () {
      LinkedHashMap<String, String> newMap = LinkedHashMap();
      childCareLeaveMap.forEach((key, value) {
        if (key == entry.key) {
          newMap[controller1.text] = controller2.text;
        }else{
          newMap[key] = value;
        }
      });
      childCareLeaveMap = newMap;
      if (childCareLeaveKey == "育児休業取得率（男性）") {
        model.maleChildCareLeave = LinkedHashMap.from(childCareLeaveMap);
      } else {
        model.femaleChildCareLeave = LinkedHashMap.from(childCareLeaveMap);
      }
      Navigator.of(context).pop();
    },
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          child: const Text(
            '職種',
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 8),
        CommonTextField(
          controller: controller1,
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          child: const Text('割合(単位：%)'),
        ),
        SizedBox(height: 8),
        CommonTextField(
          controller: controller2,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
      ],
    ),
  );
}
