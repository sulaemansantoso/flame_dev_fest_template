import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flame_devfest/pages/mainGamePage.dart';

class StartGameOverlay extends StatelessWidget {
  const StartGameOverlay({super.key, required this.game});
  final MainGamePage game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text(
                  "Start Game",
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    game.resumeEngine();
                    game.overlays.remove("startgame");
                    // game.reset();
                  },
                  child: const Text("Play "),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
