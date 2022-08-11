import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {

  List<String> bannerList = [
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
    'https://dimg04.c-ctrip.com/images/0zg6z120009hxl5q9CCF7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            _banner(),
          ],  
        ),
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