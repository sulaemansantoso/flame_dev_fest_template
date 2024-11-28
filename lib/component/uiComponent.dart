import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_devfest/pages/mainGamePage.dart';

class UiComponent extends PositionComponent with HasGameRef<MainGamePage> {
  int _score = 0;

  late TextComponent _scoreTextComponent;
  late TextComponent _liveTextComponent;

  int get score => _score;
  set score(int value) => _score = value;

  void addScore(int score) {
    _score += score;
    _scoreTextComponent.text = _score.toString();
  }

  void resetScore() {
    _score = 0;
    _scoreTextComponent.text = _score.toString();
  }

  void changeLive(int live) {
    String liveText = '';
    for (int i = 0; i < live; i++) {
      liveText += " * ";
    }
    _liveTextComponent.text = liveText;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(const Rect.fromLTWH(10, 20, 100, 50),
        Paint()..color = const Color.fromARGB(255, 22, 56, 108));

    canvas.drawRect(Rect.fromLTWH(game.size.x - 110, 20, 100, 50),
        Paint()..color = const Color.fromARGB(255, 22, 56, 108));

    super.render(canvas);
  }

  @override
  FutureOr<void> onLoad() {
    _scoreTextComponent = TextComponent(text: _score.toString());
    _scoreTextComponent.position = Vector2(20, 20);
    _scoreTextComponent.textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
    game.camera.viewport.add(_scoreTextComponent);

    _liveTextComponent = TextComponent(text: _score.toString());
    _liveTextComponent.position = Vector2(game.size.x - 110, 20);
    _liveTextComponent.textRenderer = TextPaint(
        style: const TextStyle(color: Colors.white, fontSize: 32),
        textDirection: TextDirection.rtl);
    game.camera.viewport.add(_liveTextComponent);

    return super.onLoad();
  }
}
