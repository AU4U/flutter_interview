import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/dialog/info_dialog.dart';
import 'package:flutter_interview/screens/common_widget/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../models/model.dart';

class MidItemWidget extends StatelessWidget {
  final String infoKey;

  const MidItemWidget({
    super.key,
    required this.infoKey,
  });

  @override
  Widget build(BuildContext context) {
    Model model = context.watch<Model>();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffE1E1E1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              infoKey.split(' ')[0],
              maxLines: 2,
            ),
          ),
          DottedBorder(
            radius: const Radius.circular(8),
            borderType: BorderType.RRect,
            color: const Color(0xFF377DF7),
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 0, top: 8, bottom: 8),
              color: const Color(0xffE7F2FE),
              child: Row(
                children: [
                  Text(model.info[infoKey]! + infoUnits[infoKey]!, textAlign: TextAlign.center),
                  const SizedBox(width: 4),
                  const Icon(
                    color: Color(0xFF377DF7),
                    Icons.edit,
                    size: 20,
                  ),
                ],
              ),
            ),
          ).wrapGestureDetector(
            onTap: () {
              showInfoDialog(context, infoKey: infoKey, model: model);
            },
          ),
        ],
      ),
    );
  }
}
