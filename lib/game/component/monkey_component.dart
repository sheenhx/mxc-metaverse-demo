import 'package:bonfire/bonfire.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mxc_metaverse/game/mixin/move_to_position_along_the_path_no_check.dart';
import 'package:mxc_metaverse/game/utils/game_helper.dart';
import 'package:mxc_metaverse/game/utils/monkey_sprite_sheet.dart';

import '../mixin/eat_able.dart';
import 'fruit_component.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class MonkeyComponent extends SimpleEnemy with ObjectCollision, MoveToPositionAlongThePathNoCheck, EatAble {
  FruitComponent? target;
  bool _isWait = false;

  MonkeyComponent(Vector2 position)
      : super(
          animation: MonkeySpriteSheet.simpleDirectionAnimation,
          position: position,
          width: 32,
          height: 32,
          life: 3,
        ) {
    life = 1;
    setupMoveToPositionAlongThePath(pathLineStrokeWidth: 0, pathLineColor: Colors.transparent);
    // here we configure collision of the enemy
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
  }

  @override
  void update(double dt) {
    if (target == null || target?.isEat() != false) moveToTarget(false, null);
    super.update(dt);
  }

  @override
  void onCollision(GameComponent component, bool active) {
    moveToTarget(true, component);
    super.onCollision(component, active);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  void moveToTarget(bool needChangeTarget, GameComponent? component) {
    if (_isWait) return;
    List<FruitComponent> fruits = List.empty(growable: true);
    Random random = Random();
    for (GameDecoration item in gameRef.decorations()) {
      if (item is FruitComponent && !item.isEat()) {
        if (needChangeTarget && item == target || GameHelper.instance.hasTarget(item.position.position)) continue;
        fruits.add(item);
      }
    }
    if (fruits.isNotEmpty) {
      FruitComponent newTarget = fruits[random.nextInt(fruits.length)];
      GameHelper.instance.addTarget(newTarget.position.position, target?.position.position);
      moveToPositionAlongThePath(Vector2(newTarget.position.center.dx, newTarget.position.center.dy));
      target = newTarget;
    }
  }

  @override
  void onLifeChange()  {
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
