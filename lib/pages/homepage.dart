import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/widget/search_bar.dart';
import 'package:flutter_xiecheng/widget/loading_container.dart';
import 'package:flutter_xiecheng/widget/local_nav.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:flutter_xiecheng/dao/home_dao.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/model/common_model.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];

  final defaultFixedColor = [Color.fromARGB(255, 0, 111, 245), Color.fromARGB(255, 55, 164, 255)];
  final scrollFixedColor = [Colors.white, Colors.white];

  bool _loading = true;
  bool _isBarInTop = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        _loading = false;
        localNavList = model.localNavList;
        bannerList = model.bannerList;
        subNavList = model.subNavList;
      });
    } catch (e) {
      print('error');
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: [
            _listContainer(),
            _appBar(),
          ],  
        ),
      )
    );
  }

  Widget _appBar() {
    return Column(
      children: [
        AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: 60,
          duration: const Duration(milliseconds: 300),
          // color: _fixedBarColor,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.0, 1),
              colors: _isBarInTop ? defaultFixedColor : scrollFixedColor,
            ),
          ),
          curve: Curves.linear,
          child: const SearchBar(),
        )
      ],
    );
  }

  _onScroll(offset) {
    setState(() {
      _isBarInTop = offset < 120;
    });
  }

  Widget _listContainer() {
    return NotificationListener(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
          _onScroll(scrollNotification.metrics.pixels);
        }
        return true;
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 60,
        ),
        child: ListView(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 8,
            top: 10,
          ),
          children: [
            LocalNav(localNavList: localNavList),
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
          ],
        ),
      )
    );
  }

  Widget _banner() {
    const Key key = Key('1');
    return Container(
      height: 80,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Swiper(
          itemCount: bannerList.length,
          autoplay: true,
          pagination: SwiperCustomPagination(
            builder:(BuildContext context, SwiperPluginConfig config){
              final list = <Widget>[];
              for (var i = 0; i < config.itemCount; ++i) {
                final active = i == config.activeIndex;
                list.add(Container(
                  key: Key('pagination_$i'),
                  margin: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(228)
                    ),
                    child: Opacity(
                      opacity: active ? 1 : 0.7,
                      child: Container(
                        color: Colors.white,
                        width: active ? 14 : 6,
                        height: 6,
                      ),
                    ),
                  ),
                ));
              }
              return  Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    key: key,
                    children: list,
                    mainAxisSize: MainAxisSize.min,
                  )
                )
              );
            }
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector( // ?????????????????????????????????????????????????????????????????????
              child: Image.network(
                bannerList[index].icon,
                fit: BoxFit.fill,
              )
            );
          },
        ),
      )
    );
  }
}