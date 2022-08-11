
import 'package:flutter/cupertino.dart';

class SearchBar extends StatefulWidget {
  /// 
  final bool enabled;

  const SearchBar({
    super.key,
    this.enabled = true,
  });

  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Text('搜索');
  }
}