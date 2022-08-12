import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_xiecheng/model/common_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({
    super.key,
    required this.localNavList,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: listIcon()
      ),
    );
  }

  List<Widget> listIcon() {
    final _iconList = <Widget>[];

    for (var i = 0; i < localNavList.length; i++) {
      _iconList.add(
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              Image.network(
                localNavList[i].icon,
                width: 40,
                height: 40,
              ),
              Text(
                localNavList[i].title ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        )
      );
    }

    return _iconList;
  }
}


