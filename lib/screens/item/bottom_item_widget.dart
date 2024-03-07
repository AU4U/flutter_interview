import 'dart:collection';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/common_widget/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../models/model.dart';
import '../common_widget/add_button.dart';
import '../dialog/child_care_leave_dialog.dart';

class BottomItemWidget extends StatelessWidget {
  final Map<String, String> childCareLeaveMap;
  final String childCareLeaveKey;

  const BottomItemWidget({
    super.key,
    required this.childCareLeaveMap,
    required this.childCareLeaveKey,
  });

  @override
  Widget build(BuildContext context) {
    var model = context.watch<Model>();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8, top: 0, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffE1E1E1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              childCareLeaveKey,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Column(
                    children: List.generate(childCareLeaveMap.length, (index) {
                      return Column(
                        children: [
                          BottomSubItem(
                                  childCareLeaveKey: childCareLeaveKey,
                                  entry: childCareLeaveMap.entries.elementAt(index))
                              .wrapGestureDetector(
                            onTap: () {
                              showChildCareDialog(context,
                                  childCareLeaveKey: childCareLeaveKey,
                                  childCareLeaveMap: childCareLeaveMap,
                                  entry: childCareLeaveMap.entries.elementAt(index),
                                  model: model);
                            },
                          )
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  AddButton(childCareLeaveKey: childCareLeaveKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSubItem extends StatelessWidget {
  final String childCareLeaveKey;
  final MapEntry<String, String> entry;

  const BottomSubItem({
    super.key,
    required this.childCareLeaveKey,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    Model model = context.watch<Model>();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: const Color(0xffE7F2FE),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffE1E1E1),
              width: 1,
            ),
          ),
          child: DottedBorder(
            color: const Color(0xFF377DF7),
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(entry.key),
                  Text('${entry.value}%'),
                ],
              ),
            ),
          ),
        ),
        //位置在右上角
        Positioned(
          right: 0,
          top: 0,
          child: const Icon(
            Icons.do_not_disturb_on,
            color: Colors.red,
            size: 20,
          ).wrapGestureDetector(
            onTap: () {
              if (childCareLeaveKey == "育児休業取得率（男性）") {
                model.maleChildCareLeave.remove(entry.key);
                model.maleChildCareLeave =  LinkedHashMap.from(model.maleChildCareLeave);
              } else {
                model.femaleChildCareLeave.remove(entry.key);
                model.femaleChildCareLeave =  LinkedHashMap.from(model.femaleChildCareLeave);
              }
            },
          ),
        ),
      ],
    );
  }
}
