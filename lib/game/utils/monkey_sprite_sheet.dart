import 'package:bonfire/bonfire.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class MonkeySpriteSheet {
  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "player/kong_idle.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "player/kong_bottom.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "player/kong_left.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/kong_right.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runTop => SpriteAnimation.load(
        "player/kong_top.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(64, 64),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
        idleLeft: idleDown,
        idleRight: idleDown,
        runRight: runRight,
        runLeft: runLeft,
        runDown: runDown,
        runUp: runTop,
      );
}
