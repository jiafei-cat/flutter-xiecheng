import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_xiecheng/model/common_model.dart';

class LocalNav extends StatefulWidget {
  final List<CommonModel> localNavList;

  const LocalNav({
    super.key,
    required this.localNavList,
  });

  @override
  _LocalNav createState() => _LocalNav();
}

class _LocalNav extends State<LocalNav> {
  int curPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: curPage == 0 ? 192 : 310,
          child: PageView(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias,
                child: Wrap(
                  children: listIcon(context, widget.localNavList.length > 15 ? widget.localNavList.sublist(0, 15) : [])
                ),
              ),
              PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias,
                child: Wrap(
                  children: listIcon(context, widget.localNavList.length > 16 ? widget.localNavList.sublist(16, widget.localNavList.length) : [])
                ),
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                curPage = index;
              });
            },
          )
        ),
        listdot(2, curPage),
      ],
    );
  }

  List<Widget> listIcon(context, List<CommonModel> list) {
    bool isFirstList = list.length == 15;
    final _iconList = <Widget>[];
    final screenWith = MediaQuery.of(context).size.width;
    final defaultIconBackgroundColor = [Color(0xfff2f2f2), Color(0xfff2f2f2)];
    final iconBackgroundColor = [
      [const Color.fromARGB(255, 245, 75, 71), const Color.fromARGB(255, 233, 143, 100),],
      [const Color.fromARGB(255, 60, 133, 249), const Color.fromARGB(255, 99, 176, 251),],
      [const Color.fromARGB(255, 93, 128, 255), const Color.fromARGB(255, 117, 166, 235),],
      [const Color.fromARGB(255, 31, 187, 173), const Color.fromARGB(255, 53, 196, 184),],
      [const Color.fromARGB(255, 255, 138, 57), const Color.fromARGB(255, 239, 174, 95),],
      [const Color.fromARGB(255, 254, 243, 239), const Color.fromARGB(255, 254, 243, 239),],
      [const Color.fromARGB(255, 239, 248, 255), const Color.fromARGB(255, 239, 248, 255),],
      [const Color.fromARGB(255, 242, 244, 255), const Color.fromARGB(255, 242, 244, 255),],
      [const Color.fromARGB(255, 236, 251, 248), const Color.fromARGB(255, 236, 251, 248),],
      [const Color.fromARGB(255, 255, 246, 237), const Color.fromARGB(255, 255, 246, 237),],
      [const Color.fromARGB(255, 254, 243, 239), const Color.fromARGB(255, 254, 243, 239),],
      [const Color.fromARGB(255, 239, 248, 255), const Color.fromARGB(255, 239, 248, 255),],
      [const Color.fromARGB(255, 242, 244, 255), const Color.fromARGB(255, 242, 244, 255),],
      [const Color.fromARGB(255, 236, 251, 248), const Color.fromARGB(255, 236, 251, 248),],
      [const Color.fromARGB(255, 255, 246, 237), const Color.fromARGB(255, 255, 246, 237),],
    ];
    for (var i = 0; i < list.length; i++) {
      bool isFirstIcon = i == 0;
      bool isLastIcon = i == list.length - 1;

      List<Color> curIconColor = i < iconBackgroundColor.length ? iconBackgroundColor[i] : defaultIconBackgroundColor;

      _iconList.add(
        Container(
          width: (screenWith - 25) / 5,
          height: 62,
          
          margin: EdgeInsets.only(
            right: i != 0 && i % 5 == 0 ? 1 : 1,
            bottom: 1,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: const Alignment(0.0, 1),
              colors: isFirstList ? curIconColor : defaultIconBackgroundColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                list[i].icon,
                width: 24,
                height: 24,
              ),
              Text(
                list[i].title ?? '',
                style: TextStyle(
                  color: (i < 5 && isFirstList) ? Colors.white : Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )
      );
    }

    return _iconList;
  }

  Widget listdot (int length, int activeIndex) {
    List<Widget> list = [];

    for (var i = 0; i < length; i++) {
      bool active = activeIndex == i;

      list.add(
        Container(
          key: Key('pagination_$i'),
          margin: const EdgeInsets.only(
            left: 2,
            right: 2,
          ),
          child: ClipRRect(
            // borderRadius: const BorderRadius.all(
            //   Radius.circular(40)
            // ),
            child: Opacity(
              opacity: active ? 1 : 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: active ? Color.fromARGB(255, 0, 134, 247) : Color.fromARGB(255, 203, 203, 203),
                  borderRadius: BorderRadius.all(Radius.circular(18))
                ),
                width: active ? 14 : 4,
                height: 4,
              ),
            ),
          ),
        )
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: list,
          mainAxisSize: MainAxisSize.min,
        )
      )
    );
  }
}


