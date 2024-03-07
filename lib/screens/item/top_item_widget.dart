import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/common_widget/widget_extension.dart';
import 'package:provider/provider.dart';
import '../../models/model.dart';
import '../dialog/rate_dialog.dart';

class TopItemWidget extends StatelessWidget {
  final int index;

  const TopItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String rates =
        context.select<Model, String>((model) => model.rate.values.elementAt(index).map((e) => "$e%/").toList().join());
    rates = rates.substring(0, rates.length - 1);
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
          Flexible(
            child: Text(
              //获取rate的key的值
              model.rate.keys.elementAt(index),
              maxLines: 2,
            ),
          ),
          const Flexible(
            child: Text(
              textAlign: TextAlign.center,
              "前年度/2年度前/3年度前",
              maxLines: 2,
            ),
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius:  const Radius.circular(8),
            color: const Color(0xFF377DF7),
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 0, top: 8, bottom: 8),
              color: const Color(0xffE7F2FE),
              child: Row(
                children: [
                  Text(rates),
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
              showRateDialog(context, index: index, model: model);
            },
          )
        ],
      ),
    );
  }
}
