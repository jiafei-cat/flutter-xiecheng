import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/widget/search_bar.dart';
import 'package:card_swiper/card_swiper.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  Color _fixedBarColor = Colors.blue;

  List<String> bannerList = [
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: [
          _listContainer(),
          _appBar(),
        ],  
      ),
    );
  }

  Widget _appBar() {
    return Column(
      children: [
        AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: 60,
          // margin: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 300),
          color: _fixedBarColor,
          curve: Curves.linear,
          child: const SearchBar(),
        )
      ],
    );
  }

  _onScroll(offset) {
    if (offset >= 120 && _fixedBarColor == Colors.blue) {
      setState(() {
        _fixedBarColor = Colors.white;
      });
    }

    if (offset < 120 && _fixedBarColor == Colors.white) {
      setState(() {
        _fixedBarColor = Colors.blue;
      });
    }
  }

  Widget _listContainer() {
    return NotificationListener(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
          _onScroll(scrollNotification.metrics.pixels);
        }
        return true;
      },
      child: ListView(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
        ),
        children: [
          _banner(),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
          Text('1111111111'),
        ],
      )
    );
  }

  Widget _banner() {
    return Container(
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Swiper(
          itemCount: bannerList.length,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector( // 这里用手势探测类包裹，以便后续添加图片点击事件
              child: Image.network(
                bannerList[index],
                fit: BoxFit.fill,
              )
            );
          },
        ),
      )
    );
  }
}