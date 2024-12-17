import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Text("首页");
  }
}