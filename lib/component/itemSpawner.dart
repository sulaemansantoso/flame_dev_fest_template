import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_flame_devfest/component/badItem.dart';
import 'package:flutter_flame_devfest/component/item.dart';
import 'package:flutter_flame_devfest/pages/mainGamePage.dart';

class Itemspawner extends Component with HasGameRef<MainGamePage> {
  late SpawnComponent sp;

  void reset() {
    for (var i in game.children) {
      if (i is Item) {
        game.remove(i);
      }
    }
  }

  @override
  FutureOr<void> onLoad() {
    sp = SpawnComponent(
        selfPositioning: true,
        factory: (int amount) {
          double badRandom = Random().nextDouble() * 100;

          Item i;
          if (badRandom < 30) {
            i = BadItem();
          } else {
            i = Item();
          }
          double xRandom = Random().nextDouble() * game.size.x;
          i.position = Vector2(xRandom, 0);
          i.size = Vector2(128, 128);
          //game.add(i);
          return i;
        },
        period: 1.2);
    game.add(sp);
    return super.onLoad();
  }
}
