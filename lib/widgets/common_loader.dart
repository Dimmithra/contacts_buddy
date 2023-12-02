import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonPageLoader extends StatelessWidget {
  const CommonPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: Colors.white,
      size: 30,
    );
  }
}
