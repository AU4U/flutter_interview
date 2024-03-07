import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
import 'package:oktoast/oktoast.dart';
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
      if (controller1.text.isEmpty || controller2.text.isEmpty) {
        // Toast 提示用户输入
        showToast('输入内容错误，请重新输入');
        return;
      }
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
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Text(
            '職種',
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: controller1,
        ),
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Text('割合(単位：%)'),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: controller2,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
