import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('background/colored_desert.png');
    position = Vector2(0, 0);

    size = game.canvasSize;

    return super.onLoad();
  }
}
