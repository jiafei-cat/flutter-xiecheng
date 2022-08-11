import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/pages/homepage.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({ super.key });

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int curIndex = 0;

  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(), // 去掉左右滑切换view效果
        children: [
          Homepage(),
          const Center(child: Text('社区'),),
          const Center(child: Text('消息'),),
          const Center(child: Text('行程'),),
          const Center(child: Text('我的'),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        selectedFontSize: 12,
        unselectedItemColor: _defaultColor,
        selectedItemColor: _activeColor,
        showSelectedLabels: true,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('首页', Icons.home, 0),
          _bottomItem('社区', Icons.public, 0),
          _bottomItem('消息', Icons.message, 0),
          _bottomItem('行程', Icons.calendar_month, 0),
          _bottomItem('我的', Icons.person, 0),
        ],
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
          _controller.jumpToPage(index);
        },
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      label: title,
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
    );
  }
}