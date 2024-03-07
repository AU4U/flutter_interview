import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
import 'package:oktoast/oktoast.dart';

import '../../models/model.dart';
import '../common_widget/common_text_field.dart';

void showRateDialog(BuildContext context, {required int index, required Model model}) {
  var items = model.rate;
  var item = items.values.elementAt(index);
  var controller1 = TextEditingController(text: item[0]);
  var controller2 = TextEditingController(text: item[1]);
  var controller3 = TextEditingController(text: item[2]);
  showCommonDialog(
    context,
    title: model.rate.keys.elementAt(index),
    action: () {
      if (controller1.text.isEmpty || controller2.text.isEmpty || controller3.text.isEmpty) {
        // Toast 提示用户输入
        showToast('输入内容错误，请重新输入');
        return;
      }
      if(int.parse(controller1.text) > 100 || int.parse(controller2.text) > 100 || int.parse(controller3.text) > 100
      || int.parse(controller1.text) < 0 || int.parse(controller2.text) < 0 || int.parse(controller3.text) < 0){
        // Toast 提示用户输入
        showToast('输入内容错误，请重新输入');
        return;
      }
      model.rate[model.rate.keys.elementAt(index)] = [controller1.text, controller2.text, controller3.text];
      model.rate = Map.from(model.rate);
      Navigator.of(context).pop();
    },
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Text(
            ' 前年度(単位：%)',
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: controller1,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Text(' 2年度前(単位：%)'),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: controller2,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Text(' 3年度前(単位：%)'),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: controller3,
          keyboardType: TextInputType.number,
        ),
      ],
    ),
  );
}
