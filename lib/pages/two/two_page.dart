import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

const List<String> imageUrls = [
  "https://img1.baidu.com/it/u=1604966489,310434455&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=547",
  "https://img1.baidu.com/it/u=291875999,1687255827&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=355",
  "https://img2.baidu.com/it/u=1362484122,1927020880&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
  "https://img0.baidu.com/it/u=180619179,477615584&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
  "https://img0.baidu.com/it/u=3122062802,488032311&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
  "https://img0.baidu.com/it/u=3050568905,1585633762&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=753"
];

class ImageData {
  final String text;
  final String imageUrl;

  ImageData(this.text, this.imageUrl);
}

class _TwoPageState extends State<TwoPage> {
  List<ImageData> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    for (int i = 0; i < imageUrls.length; i++) {
      ImageData imageData = ImageData("dog$i", imageUrls[i]);
      data.add(imageData);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return _AlertDialog(
        text: "数据为空",
        onPressed: () {
          getData();
          setState(() {});
        },
      );
    }
    return ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          ImageData imageData = data[index];
          return _ListItem(
            text: imageData.text,
            imageUrl: imageData.imageUrl,
          );
        });
  }
}

class _AlertDialog extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const _AlertDialog({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('提示'),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: const Text('获取数据'),
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final String imageUrl;

  const _ListItem({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.fitWidth,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
