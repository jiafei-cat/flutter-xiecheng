
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// LoadingContainer 用于展示子组件的加载态
class LoadingContainer extends StatelessWidget {
  /// 是否显示loading
  final bool isLoading;
  final Widget child;

  const LoadingContainer({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? Stack(
      children: [
        _loadingView,
        child,
      ],
    ) : child;
  }

  Widget get _loadingView {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}