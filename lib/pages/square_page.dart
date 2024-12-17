import 'package:flutter/cupertino.dart';

class SquarePage extends StatefulWidget{
  const SquarePage({super.key});

  @override
  State<StatefulWidget> createState() => _SquareState();
}

class _SquareState extends State<SquarePage>{
  @override
  Widget build(BuildContext context) {
    return Text("广场");
  }
}