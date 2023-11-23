import 'package:flutter/material.dart';
import 'package:flutter_demo_test/pages/one/page_one.dart';
import 'package:flutter_demo_test/pages/three/page_three.dart';
import 'package:flutter_demo_test/pages/two/two_page.dart';

import 'pages/four/four_page.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  BottomNavigationExampleState createState() => BottomNavigationExampleState();
}

class BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const PageOne(),
    const TwoPage(),
    const PageThree(),
    const FourPage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void someTh(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "1"),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "2"),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "3"),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "4"),
        ],
      ),
    );
  }
}


