import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/item/bottom_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/model.dart';
import 'item/mid_Item.dart';
import 'item/top_item_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(
            children: const [
              TopWidget(),
              MidWidget(),
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> rate = context.select<Model, Map<String, List<String>>>((model) => model.rate);
    return Column(
      children: List.generate(rate.length, (index) {
        return Column(
          children: [
            index != rate.length - 1 ? Container() : const SizedBox(height: 16),
            TopItemWidget(index: index),
          ],
        );
      }),
    );
  }
}

class MidWidget extends StatelessWidget {
  const MidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> info = context.select<Model, Map<String, String>>((model) => model.info);
    return Column(
      children: List.generate(info.length, (index) {
        return Column(
          children: [
            index == info.length ? Container() : const SizedBox(height: 16),
            MidItemWidget(infoKey: info.keys.elementAt(index)),
          ],
        );
      }),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> maleChildCareLeave =
        context.select<Model, Map<String, String>>((model) => model.maleChildCareLeave);
    Map<String, String> femaleChildCareLeave =
        context.select<Model, Map<String, String>>((model) => model.femaleChildCareLeave);
    return Column(
      children: [
        const SizedBox(height: 16),
        BottomItemWidget(childCareLeaveMap: maleChildCareLeave, childCareLeaveKey: '育児休業取得率（男性）'),
        const SizedBox(height: 16),
        BottomItemWidget(childCareLeaveMap: femaleChildCareLeave, childCareLeaveKey: '育児休業取得率（女性）'),
      ],
    );
  }
}
