import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/assets_images.dart';
import 'package:task_manager/widgets/custom_appbar.dart';

class ScaffoldBackground extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;

  final FloatingActionButton? floatingActionButton;
  const ScaffoldBackground(
      {super.key, this.appBar, required this.child, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? CustomAppbar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImages.backgroundSVG),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
