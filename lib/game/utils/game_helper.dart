import 'dart:math';

import 'package:flame/components.dart';
import 'package:bonfire/bonfire.dart';

import 'common_sprite_sheet.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
class GameHelper {
  static GameHelper? _instance;

  factory GameHelper() => _getInstance();

  static GameHelper get instance => _getInstance();

  static GameHelper _getInstance() {
    _instance ??= GameHelper._internal();
    return _instance!;
  }

  GameHelper._internal();

  final List<Vector2> _position = List.empty(growable: true);

  final List<Vector2> _target = List.empty(growable: true);

  final List<GameComponent> _waitList = List.empty(growable: true);

  final Random _random = Random();

  final List<Future<SpriteAnimation>> _sprites = [
    CommonSpriteSheet.fruitSprite1,
    CommonSpriteSheet.fruitSprite2,
  ];

  void addPosition(Vector2 position) {
    if (!_position.contains(position)) _position.add(position);
  }

  Vector2? randomPosition() {
    if (_position.isEmpty) return null;
    var rand = Random();
    return _position[rand.nextInt(_position.length)];
  }

  void addTarget(Vector2 position, Vector2? oldPosition) {
    if (!_target.contains(position)) {
      if (oldPosition != null) _target.remove(oldPosition);
      if (_target.length >= 5) _target.removeAt(0);
      _target.add(position);
    }
  }

  bool hasTarget(Vector2 position) {
    if (_target.contains(position)) {
      return true;
    } else {
      return false;
    }
  }

  bool canWait(GameComponent comp, GameComponent nextComp) {
    if (_waitList.contains(comp) || _waitList.contains(nextComp)) {
      return true;
    } else {
      return false;
    }
  }

  void addWait(GameComponent comp, GameComponent nextComp) {
    if (!_waitList.contains(comp)) {
      _waitList.add(comp);
    }
    if (!_waitList.contains(nextComp)) {
      _waitList.add(nextComp);
    }
  }

  void removeWait(GameComponent comp, GameComponent nextComp) {
    if (_waitList.contains(comp)) {
      _waitList.remove(comp);
    }
    if (_waitList.contains(nextComp)) {
      _waitList.remove(nextComp);
    }
  }

  Future<SpriteAnimation> getFruit() {
    return _sprites[_random.nextInt(_sprites.length)];
  }
}
