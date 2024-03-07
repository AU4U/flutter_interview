import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
import 'package:oktoast/oktoast.dart';
import '../../models/model.dart';
import '../common_widget/common_text_field.dart';

void showChildCareAddDialog(
  BuildContext context, {
  required Model model,
  required String childCareLeaveKey,
}) {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  showCommonDialog(
    context,
    title: childCareLeaveKey,
    action: () {
      if (controller1.text.isEmpty || controller2.text.isEmpty) {
        showToast('输入内容错误，请重新输入');
        return;
      }
      if (childCareLeaveKey == "育児休業取得率（男性）") {
        model.maleChildCareLeave[controller1.text] = controller2.text;
        model.maleChildCareLeave = LinkedHashMap.from(model.maleChildCareLeave);
      } else {
        model.femaleChildCareLeave[controller1.text] = controller2.text;
        model.femaleChildCareLeave = LinkedHashMap.from(model.femaleChildCareLeave);
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
