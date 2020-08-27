import 'dart:ui'; /* Canvas and Size class */

import 'package:flame/game.dart'; /* Flames main Game class */
import 'package:flame/gestures.dart';
import 'package:flame/flame_audio.dart';

import 'package:flutter/cupertino.dart'; /* flame's gestures mixins*/

class WoodGame extends Game with HorizontalDragDetector {
  Size screenSize;
  double dragInitial;
  double dragEnd;
  double chopCount = 0;
  bool isTreeDead = false;
  FlameAudio audio = FlameAudio();

  /* draw all the objects on the screen */
  void render(Canvas canvas) {
    /* draw a simple background */
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffb2c3ab);
    canvas.drawRect(bgRect, bgPaint);
    /* draw the tree */
    double screenCenterX = screenSize.width / 2;
    Rect treeRect =
        Rect.fromLTWH(screenCenterX - 75, 0, 150, screenSize.height);
    Paint treePaint = Paint();
    treePaint.color = Color(0xff3a250f);
    if (!isTreeDead) {
      canvas.drawRect(treeRect, treePaint);
    }
  }

  /* handles the movements of objects and other components that
    need to be updated */
  void update(double t) {}

  /* Override the Game class function for sizing */
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  /* chop that tree */
  void onHorizontalDragStart(DragStartDetails d) {
    /* handle the drag down here */
    print(
        "Player drag down on ${d.globalPosition.dx} - ${d.globalPosition.dy}");
    dragInitial = d.globalPosition.dx;
  }

  void onHorizontalDragUpdate(DragUpdateDetails d) {
    dragEnd = d.globalPosition.dx;
  }

  void onHorizontalDragEnd(DragEndDetails d) {
    /* ignore if tree is dead */
    if (isTreeDead) return;
    /* otherwise check for tree chops */
    double screenCenterX = screenSize.width / 2;
    /* handle the drag end here */
    print("Player drag end");
    if (dragInitial < screenCenterX - 75 && dragEnd > screenCenterX + 75) {
      print("Tree has been chopped");
      chopCount++;
      audio.play('chop.mp3');
      if (chopCount >= 5) {
        isTreeDead = true;
      }
    }
  }
}
