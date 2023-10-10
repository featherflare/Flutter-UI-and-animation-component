import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class FirstGame extends FlameGame with DoubleTapDetector {
  SpriteComponent girl = SpriteComponent();
  bool running = true;
  String direction = 'down';
  SpriteAnimationComponent girlAnimation = SpriteAnimationComponent();
  double speed = 2.0;
  late Sprite platformSprite;
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    print('test');

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('ninjagirl/background.png')
      ..size = size;
    add(background);

    platformSprite = await loadSprite('ninjagirl/platform.png');

    SpriteComponent platfrom = SpriteComponent()
      ..sprite = platformSprite
      ..size = Vector2(200, 50)
      ..x = 0
      ..y = 200;

    girl
      ..sprite = await loadSprite('ninjagirl/boy.png')
      ..size = Vector2(200, 200)
      ..x = 150
      ..y = 700;
    add(girl);

    var spriteSheet = await images.load('ninjagirl/Glide_Sprite.png');
    final spriteSize = Vector2(152, 150);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.2,
      textureSize: Vector2(101, 95),
    );
    girlAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 200
          ..y = 350
          ..size = spriteSize;
    add(girlAnimation);
  }

  @override
  update(double dt) {
    super.update(dt);
    switch (direction) {
      case 'down':
        girlAnimation.y += speed;
        break;
      case 'up':
        girlAnimation.y -= speed;
        break;
    }

    if (girlAnimation.y > 400) {
      direction = 'up';
    }

    if (girlAnimation.y < 10) {
      direction = 'down';
    }
  }

  @override
  void onDoubleTap() {
    if (running) {
      pauseEngine();
    } else {
      resumeEngine();
    }
    running = !running;
  }
}
