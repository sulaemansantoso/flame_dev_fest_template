import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_devfest/component/item.dart';

class BadItem extends Item {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await game.loadSprite('bad_item/saw_move.png');
    anchor = Anchor.center;
    size = Vector2(100, 100);
    add(CircleHitbox());
  }
}
