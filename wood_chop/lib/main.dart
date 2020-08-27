import 'package:flame/util.dart';

import 'package:wood_chop/wood-game.dart';

import 'package:flutter/material.dart';

void main() {
  /* create an instance of the game loop */
  WoodGame game = WoodGame();
  /* run the app using the game widget */
  runApp(game.widget);
  /* create an instance of the Flame Util class*/
  Util flameUtil = Util();
  /* set the app to fullscreen and lock the orientation to landscape */
  flameUtil.fullScreen();
  flameUtil.setLandscape();
}
