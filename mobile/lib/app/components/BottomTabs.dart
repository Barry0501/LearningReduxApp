import 'package:flutter/material.dart';
import 'package:mobile/core/widgets/BottomBar/bottom_bar.dart';
import 'package:core/core.dart';

class BottomTabs extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTap;

  const BottomTabs({Key key,@required this.selectedTab,@required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Messages messages = new Messages();
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomBar(
        currentIndex: selectedTab,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            title: Text(messages.nowInTheaters),
            icon: const Icon(Icons.theaters),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            title: Text(messages.showtimes),
            icon: const Icon(Icons.schedule),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            title: Text(messages.comingSoon),
            icon: const Icon(Icons.whatshot),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}