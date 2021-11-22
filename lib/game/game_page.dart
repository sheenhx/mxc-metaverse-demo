import 'dart:math';

import 'package:bonfire/bonfire.dart';

import 'package:flutter/material.dart';
import 'package:mxc_metaverse/game/utils/common_sprite_sheet.dart';
import 'package:mxc_metaverse/game/utils/game_helper.dart';

import 'component/monkey_component.dart';
import 'component/fruit_component.dart';
import 'component/player_component.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      // joystick: JoystickMoveToPosition(),
      map: TiledWorldMap(
        'game/map_forest.json',
        forceTileSize: const Size(32, 32),
        objectsBuilder: {
          'monkey': (properties) => MonkeyComponent(properties.position),
          'fruit': (properties) => FruitComponent(properties.position, GameHelper.instance.getFruit()),
        },
      ),
      player: MyPlayer(Vector2(750, 750)),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 1),
    );
  }
}
