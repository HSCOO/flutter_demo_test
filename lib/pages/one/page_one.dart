import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 背景内容
        const Center(child: Text('One')),
        // 底部拖动框
        DraggableScrollableSheet(
          initialChildSize: 0.3, // 初始高度占屏幕比例
          minChildSize: 0.1, // 最小高度占屏幕比例
          maxChildSize: 0.8, // 最大高度占屏幕比例
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // 阴影颜色
                    spreadRadius: 5, // 阴影的扩散半径
                    blurRadius: 7, // 阴影的模糊半径
                    offset: const Offset(0, 3), // 阴影的水平和垂直偏移
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ), // 这里应用相同的圆角
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container(color: Colors.white,child: const Icon(Icons.drag_handle),)),
                      ],
                    ),
                
                    PageView(children: [
                      _PageItemView(
                        scrollController: scrollController,
                      ),
                      _PageItemView(
                        scrollController: scrollController,
                      ),
                      _PageItemView(
                        scrollController: scrollController,
                      ),
                    ]),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _PageItemView extends StatelessWidget {
  final ScrollController scrollController;

  const _PageItemView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '1.Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with '
              'Metioned in text with Metioned in text with Metioned in text with Metioned in text with ',
              overflow: TextOverflow.clip,
            ),
            _TitleTextField(
              number: 1,
            ),
            _TitleTextField(
              number: 2,
            ),
            _TitleTextField(
              number: 3,
            ),
            _TitleTextField(
              number: 4,
            ),
            _TitleTextField(
              number: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleTextField extends StatelessWidget {
  final int number;

  const _TitleTextField({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("($number) abacsddskajdwjdkawjdkajwdkjwakdjakwjdj"),
          const SizedBox(
            width: 300,
            child: CupertinoTextField(),
          ),
        ],
      ),
    );
  }
}
