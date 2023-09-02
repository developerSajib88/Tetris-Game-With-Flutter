import 'package:flutter/material.dart';

import 'global_variable.dart';

class TetrisController {
  TetriminoType type;
  TetrisController({required this.type});

  List<int> position = [];

  void initializeTetris(){
    switch(type){
      case TetriminoType.L:
        position = [6,19,32,33];
        break;

      case TetriminoType.T:
        position = [5,6,7,19,32];
        break;

      case TetriminoType.O:
        position = [5,6,7,18,19,20,31,32,33];
        break;

      case TetriminoType.I:
        position = [6,19,32,45];
        break;

      case TetriminoType.J:
        position = [6,19,32,31];
        break;

      case TetriminoType.Z:
        position = [4,5,6,19,32,33,34];
        break;

      case TetriminoType.S:
        position = [8,7,6,19,32,31,30];
        break;

    }
  }


  void positionChanging({required Direction direction}){

    switch(direction){
      case Direction.down:
        for(int i = 0; i < position.length; i++){
          position[i] += columLength;
        }
        break;

      case Direction.left:
        for(int i = 0; i < position.length; i++){
          position[i] -= 1;
        }
        break;

      case Direction.right:
        for(int i = 0; i < position.length; i++){
          position[i] += 1;
        }
        break;
    }

  }



  Color tetrisColor(){
    switch(type){
      case TetriminoType.L:
        return Colors.red;
      case TetriminoType.J:
        return Colors.green;
      case TetriminoType.O:
        return Colors.blue;
      case TetriminoType.Z:
        return Colors.green;
      case TetriminoType.I:
        return Colors.purple;
      case TetriminoType.T:
        return Colors.pink;
      case TetriminoType.J:
        return Colors.deepOrange;
      case TetriminoType.S:
        return Colors.cyan;
    }
  }




}