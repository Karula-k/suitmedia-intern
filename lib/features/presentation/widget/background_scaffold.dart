import 'package:flutter/material.dart';

//background image widget
class BackgroundScaffold extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  const BackgroundScaffold({Key? key, required this.image, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
        ),
      ),
    );
  }
}
