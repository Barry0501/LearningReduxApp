import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class BottomBar extends StatelessWidget {

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem>items;

  const BottomBar({Key key,@required this.currentIndex,@required this.onTap,@required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: Colors.black54,
      activeColor: Colors.white,
      iconSize: 24.0,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
    );
  }
}