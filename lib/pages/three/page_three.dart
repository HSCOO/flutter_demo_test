import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _IconTextButton(),
            _IconTextButton(),
            _IconTextButton(),
          ],
        ),
      ),
    );
  }
}

enum IconTextState { normal, clicked, disable }

class _IconTextButton extends StatefulWidget {
  const _IconTextButton({super.key});

  @override
  State<_IconTextButton> createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<_IconTextButton> {
  IconTextState currentState = IconTextState.normal;
  bool isClicked = false;
  Color currentColor = Colors.black;

  changeState() {
    switch (currentState) {
      case IconTextState.normal:
        currentColor = Colors.black;
        isClicked = false;
        break;
      case IconTextState.clicked:
        currentColor = Colors.blue;
        isClicked = true;
        break;
      case IconTextState.disable:
        currentColor = Colors.grey;
        isClicked = false;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentState = IconTextState.clicked;
        changeState();
      },
      onLongPress: () {
        currentState = IconTextState.disable;
        changeState();
      },
      child: Center(
        child: Row(
          children: [
            _TextCircle(
              isClicked: isClicked,
              text: "A",
              color: currentColor,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "data",
                style: TextStyle(
                  color: isClicked ? Colors.black : currentColor,
                  decoration: currentState == IconTextState.disable
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextCircle extends StatelessWidget {
  final Color color;
  final String text;
  final bool isClicked;

  const _TextCircle({
    super.key,
    required this.color,
    required this.text,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8), // 内边距，根据需要调整
      decoration: BoxDecoration(
        shape: BoxShape.circle, // 圆形装饰
        border: Border.all(color: color, width: 2), // 设置边框颜色和宽度
        color: isClicked ? color.withOpacity(0.5) : null, // 背景颜色
      ),
      child: Text(
        text, // 文本内容
        style: TextStyle(color: color), // 文本样式
      ),
    );
  }
}
