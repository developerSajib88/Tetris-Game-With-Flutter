import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris_game/global_variable.dart';
import 'package:tetris_game/tetris_controller.dart';
import 'package:tetris_game/tetris_controller.dart';
import 'package:tetris_game/tetris_item.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  TetrisController tetrisController = TetrisController(type: TetriminoType.J);

  void tetrisPosition(){
    Timer.periodic(const Duration(milliseconds: 800), (timer) {

      for(int i = 0; i< tetrisController.position.length; i++){
        if(tetrisController.position[i] > 155){
          //tetrisController.initializeTetris();
          createNewTetris();
          print("\\\\\\\\\\\\\\\\\\\\");
        }
      }

      tetrisController.positionChanging(direction: Direction.down);
      setState(() {});
    });

  }





  void createNewTetris(){

    Random rand = Random();
    TetriminoType tetriminoType = TetriminoType.values[rand.nextInt(TetriminoType.values.length)];
    tetrisController = TetrisController(type: tetriminoType);
    tetrisController.initializeTetris();
  }






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tetrisController.initializeTetris();
    tetrisPosition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsetsDirectional.all(10),
        child: SafeArea(
          child: Column(
            children: [

              Expanded(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowLength,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3
                      ),
                      itemCount: columLength * rowLength,
                      itemBuilder: (context,index)=>
                          TetrisItem(
                              itemColor: tetrisController.position.contains(index)?
                              tetrisController.tetrisColor():
                              Colors.grey.withOpacity(.900),
                              itemNumber: index
                          )
                  )
              ),


              //const SizedBox(height: 50,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                IconButton(
                    onPressed: (){
                      tetrisController.positionChanging(direction: Direction.left);
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)
                ),


                const SizedBox(width: 50,),

                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.rotate_left,color: Colors.white,)
                ),


                  const SizedBox(width: 50,),


                  IconButton(
                    onPressed: (){
                      tetrisController.positionChanging(direction: Direction.right);
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ),


              ],),


              const SizedBox(height: 30,)


            ],
          ),
        ),
      ),
    );
  }
}
