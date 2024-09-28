import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensor/game_screen_controller.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  StreamSubscription? _gyroscopeSubscription;
  GameScreenController gameScreenController = GameScreenController();
  double _gyroX = 0.0; 
  double _gyroY = 0.0; 
  
  double widthScreen = 0;
  double heightScreen = 0;

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _gyroscopeSubscription = gyroscopeEventStream().listen((action){
        setState(() {
          _gyroX = action.x; 
          _gyroY = action.y; 
        });
      });
     });
  }

  @override
  void dispose() {
    _gyroscopeSubscription?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: gameScreenController.getTopPosition(_gyroX, heightScreen),
              left: gameScreenController.getLeftPosition(_gyroY, widthScreen),
              child: Image.asset('assets/ball.png', width: 30, height: 30,)
            ),
          ],
        ),
      );
  }
}