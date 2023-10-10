import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillSourceArray() {
  return [
    'assets/images/animalspics/dino.png',
    'assets/images/animalspics/dino.png',
    'assets/images/animalspics/wolf.png',
    'assets/images/animalspics/wolf.png',
    'assets/images/animalspics/peacock.png',
    'assets/images/animalspics/peacock.png',
    'assets/images/animalspics/whale.png',
    'assets/images/animalspics/whale.png',
    'assets/images/animalspics/octo.png',
    'assets/images/animalspics/octo.png',
    'assets/images/animalspics/fish.png',
    'assets/images/animalspics/fish.png',
    'assets/images/animalspics/frog.png',
    'assets/images/animalspics/frog.png',
    'assets/images/animalspics/seahorse.png',
    'assets/images/animalspics/seahorse.png',
    'assets/images/animalspics/girraf.png',
    'assets/images/animalspics/girraf.png',
  ];
}

enum Level { Hard, Medium, Easy }

List<String> getSourceArray(Level level) {
  List sourceArray = fillSourceArray();
  List<String> levelAndKindList = [];
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState =
      List.generate(getSourceArray(level).length, (index) => true);
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = List.generate(
      getSourceArray(level).length, (index) => GlobalKey<FlipCardState>());
  return cardStateKeys;
}
