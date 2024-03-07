import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
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
      if (childCareLeaveKey == "育児休業取得率（男性）") {
        model.maleChildCareLeave[controller1.text] = controller2.text;
        model.maleChildCareLeave =  LinkedHashMap.from(model.maleChildCareLeave);
      } else {
        model.femaleChildCareLeave[controller1.text] = controller2.text;
        model.femaleChildCareLeave =  LinkedHashMap.from(model.femaleChildCareLeave);
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
