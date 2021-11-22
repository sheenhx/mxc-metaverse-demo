import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:mxc_metaverse/game/utils/common_sprite_sheet.dart';
import 'package:mxc_metaverse/game/utils/game_helper.dart';

import '../mixin/eat_able.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class FruitComponent extends GameDecoration with Sensor {
  bool _isEat = false;

  bool isEat() => _isEat;

  FruitComponent(Vector2 position, Future<SpriteAnimation> spriteAnimation)
      : super.withAnimation(
          spriteAnimation,
          position: position,
          height: 32,
          width: 32,
        );

  @override
  void onContact(GameComponent component) async {
    if (component is EatAble) {
      component.eatFruit();
      chekFruitCount();
    }
  }

  void chekFruitCount() {
    var count = 1;
    for (var item in gameRef.decorations()) {
      if (item is FruitComponent) count += 1;
    }
    if (count <= 8) {
      final position = GameHelper.instance.randomPosition();
      if (position != null) gameRef.add(FruitComponent(position, GameHelper.instance.getFruit()));
    }
    removeFromParent();
    GameHelper.instance.addPosition(position.position);
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
      ),
    );
    _isEat = true;
  }
}
