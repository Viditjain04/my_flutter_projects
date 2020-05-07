import 'package:animation_flare/smart_flare_animation.dart';
import 'package:smart_flare/smart_flare.dart';
import 'package:flutter/material.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  @override
  Widget build(BuildContext context) {
    var animationHeight = 251.0;
    var animationWidth = 295.0;

    var animationWidthIcons = animationWidth / 3;
    var halfAnimationHeight = animationHeight / 2;

    var activeAreas = [
      ActiveArea(
        area: Rect.fromLTWH(
          0,
          0,
          animationWidthIcons,
          halfAnimationHeight,
        ),
        debugArea: true,
        animationName: 'camera_tapped',
        guardComingFrom: ['deactivate'],
      ),
      ActiveArea(
        area: Rect.fromLTWH(
          animationWidthIcons,
          0,
          animationWidthIcons,
          halfAnimationHeight,
        ),
        debugArea: true,
        animationName: 'pulse_tapped',
        guardComingFrom: ['deactivate'],
      ),
      ActiveArea(
        area: Rect.fromLTWH(
          animationWidthIcons*2,
          0,
          animationWidthIcons,
          halfAnimationHeight,
        ),
        debugArea: true,
        animationName: 'image_tapped',
        guardComingFrom: ['deactivate'],
      ),
      ActiveArea(
        area: Rect.fromLTWH(
          0,
          animationHeight / 2,
          animationWidth,
          animationHeight / 2,
        ),
        debugArea: true,
        animationsToCycle: ['activate', 'deactivate'],
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 18, 222),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareActor(
          height: animationHeight,
          width: animationWidth,
          filename: 'assets/button-animation.flr',
          startingAnimation: 'deactivate',
          activeAreas: activeAreas,
        ),
      ),
    );
  }
}
