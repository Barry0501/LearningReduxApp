import 'package:flutter/material.dart';
import 'package:mobile/app/components/BottomTabs.dart';
import 'package:mobile/app/data/images.dart';

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void _tabSelected(int newIndex) {
    setState(() {
      selectedTab = newIndex;
      tabController.index = newIndex;
    });
  }

  Widget _buildTabContent() {
    return Positioned.fill(
      child: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: Center(
              child: Text('Page 1'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Page 3'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageBackground = Image.asset(
      ImageAssets.backgroundImage,
      fit: BoxFit.cover,
    );

    final content = Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Stack(
        children: <Widget>[
          _buildTabContent(),
          BottomTabs(
            selectedTab: selectedTab,
            onTap: _tabSelected,
          ),
        ],
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        imageBackground,
        content,
      ],
    );
  }
}
