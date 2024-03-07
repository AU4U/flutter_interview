
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/common_dialog.dart';
import 'package:oktoast/oktoast.dart';
import '../../models/model.dart';
import '../common_widget/common_text_field.dart';

void showInfoDialog(BuildContext context, {required String infoKey, required Model model}) {
  // var items = model.info;
  final TextEditingController controller = TextEditingController(text: model.info[infoKey]);
  showCommonDialog(
    context,
    title: infoKey,
    action: () {
      model.info[infoKey] = controller.text;
      if (controller.text.isEmpty) {
        showToast('输入内容错误，请重新输入');
        return;
      }
      model.info = Map.from(model.info);
      Navigator.of(context).pop();
    },
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        CommonTextField(
          controller: controller,
          keyboardType: TextInputType.number,
        ),
      ],
    ),
  );
}
