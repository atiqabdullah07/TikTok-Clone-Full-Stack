//

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class AnimationTest extends StatelessWidget {
  const AnimationTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: LikeButton(
        size: 100,
        isLiked: true,
      )),
    );
  }
}
