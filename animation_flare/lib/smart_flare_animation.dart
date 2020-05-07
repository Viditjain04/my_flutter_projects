import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

enum AnimationToPlay {
  Active,
  Deactive,
  CameraTapped,
  PulseTapped,
  ImageTapped
}

class SmartFlareAnimation extends StatefulWidget {
  @override
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  AnimationToPlay _animationToPlay = AnimationToPlay.Deactive;
  AnimationToPlay _lastPlayedAnimation;

  final FlareControls animationControls = FlareControls();

  static const double AnimationWidth = 295.0;
  static const double AnimationHeight = 251.0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (tapInfo) {
          setState(() {
            var localTouchPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(tapInfo.globalPosition);

            var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;
            var leftSideTouched = localTouchPosition.dx < AnimationWidth / 3;
            var rightSideTouched =
                localTouchPosition.dx > (AnimationWidth / 3) * 2;
            var middleTouched = !rightSideTouched && !leftSideTouched;

            if (leftSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.CameraTapped);
            } else if (middleTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.PulseTapped);
            } else if (rightSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.ImageTapped);
            } else {
              if (isOpen) {
                _setAnimationToPlay(AnimationToPlay.Deactive);
              } else {
                _setAnimationToPlay(AnimationToPlay.Active);
              }

              isOpen = !isOpen;
            }
          });
        },
        child: FlareActor(
          'assets/button-animation.flr',
          animation: _getAnimationName(_animationToPlay),
          controller: animationControls,
        ),
      ),
    );
  }

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Active: return 'activate';
      case AnimationToPlay.Deactive: return 'deactivate';
      case AnimationToPlay.CameraTapped: return 'camera_tapped';
      case AnimationToPlay.PulseTapped: return 'pulse_tapped';
      case AnimationToPlay.ImageTapped: return 'image_tapped';
      default: return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animation) {
    var isTappedAnimation = _getAnimationName(animation).contains('_tapped');
    
    if (isTappedAnimation && _lastPlayedAnimation == AnimationToPlay.Deactive) {
          return;
        }

    animationControls.play(_getAnimationName(animation));
    _lastPlayedAnimation = animation;
  }
}
