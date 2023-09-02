import 'package:flutter/material.dart';

class TetrisItem extends StatefulWidget {
  final Color itemColor;
  final int itemNumber;
  const TetrisItem({Key? key,
    required this.itemColor,
    required this.itemNumber}) : super(key: key);

  @override
  State<TetrisItem> createState() => _TetrisItemState();
}

class _TetrisItemState extends State<TetrisItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.itemColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Center(
        child: Text(
            widget.itemNumber.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
