import 'package:flutter/cupertino.dart';

class SubscribePage extends StatefulWidget{
  const SubscribePage({super.key});

  @override
  State<StatefulWidget> createState() => _SubscribeState();
}

class _SubscribeState extends State<SubscribePage>{
  @override
  Widget build(BuildContext context) {
    return Text("订阅");
  }
}