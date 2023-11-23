import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("UserName"),
            const Padding(padding: EdgeInsets.all(10)),
            CupertinoTextField(
              controller: _textEditingController,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                String? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _SecondPage(
                      name: _textEditingController.text,
                    ),
                  ),
                );
                if (result == "0"){
                  _textEditingController.text = "";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  final String name;

  const _SecondPage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("hello $name"),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                child: const Text('注销'),
                onPressed: () {
                  Navigator.pop(context, "0");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
