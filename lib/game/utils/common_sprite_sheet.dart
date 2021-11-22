import 'package:bonfire/bonfire.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class CommonSpriteSheet {
  static Future<SpriteAnimation> get smokeExplosion => SpriteAnimation.load(
        "smoke_explosin.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get fruitSprite1 => SpriteAnimation.load(
        "fruit_1.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 1.5,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get fruitSprite2 => SpriteAnimation.load(
        "fruit_2.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 1.5,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<Sprite> get barrelSprite => Sprite.load('itens/barrel.png');
}
