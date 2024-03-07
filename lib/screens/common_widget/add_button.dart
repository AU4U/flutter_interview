import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/common_widget/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../models/model.dart';
import '../dialog/child_care_leave_add_dialog.dart';

class AddButton extends StatelessWidget {
  final String childCareLeaveKey;

  const AddButton({
    super.key,
    required this.childCareLeaveKey,
  });

  @override
  Widget build(BuildContext context) {
    var model = context.watch<Model>();
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 8, top: 0, bottom: 0),
      child: DottedBorder(
        padding: const EdgeInsets.all(1),
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        color: const Color(0xFF377DF7),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 12, right: 0, top: 4, bottom: 4),
          decoration: BoxDecoration(color: const Color(0xffE7F2FE), borderRadius: BorderRadius.circular(10)),
          child: const Text("+",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF377DF7),
              )),
        ).wrapGestureDetector(
          onTap: () {
            showChildCareAddDialog(context, model: model, childCareLeaveKey: childCareLeaveKey);
          },
        ),
      ),
    );
  }
}
