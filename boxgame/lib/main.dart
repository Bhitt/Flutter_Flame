import 'package:boxgame/box-game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  BoxGame game  = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
   /* create an instance of Flame's Util class */
  Util flameUtil = Util();
  /* make the game fullscreen and locked to portrait mode */
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  flameUtil.addGestureRecognizer(tapper);
}