import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:mxc_metaverse/game/utils/monkey_sprite_sheet.dart';

import '../mixin/eat_able.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class MyPlayer extends SimplePlayer with ObjectCollision, EatAble {
  MyPlayer(Vector2 position)
      : super(
          animation: MonkeySpriteSheet.simpleDirectionAnimation,
          width: 32,
          height: 32,
          position: position,
          life: 3,
          speed: 300,
        ) {
    life = 1;

    /// here we configure collision of the player
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(20, 20),
            align: Vector2(6, 6),
          ),
        ],
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onLifeChange() {
    if (life == 1) {
      width = 32;
      height = 32;
      setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
              size: const Size(20, 20),
              align: Vector2(6, 6),
            )
          ],
        ),
      );
    } else if (life == 2) {
      width = 56;
      height = 56;
      setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
              size: const Size(20, 20),
              align: Vector2(18, 18),
            )
          ],
        ),
      );
    } else if (life == 3) {
      width = 80;
      height = 80;
      setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
              size: const Size(20, 20),
              align: Vector2(30, 30),
            )
          ],
        ),
      );
    }
  }
}
