import 'package:bonfire/bonfire.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
mixin EatAble on Attackable {
  bool _isGrowth = true;

  void eatFruit() {
    if (life == maxLife) {
      _isGrowth = false;
    } else if (life == 1) {
      _isGrowth = true;
    }
    if (_isGrowth) {
      addLife(1);
    } else {
      addLife(-1);
    }
    onLifeChange();
  }

  void onLifeChange();
}
