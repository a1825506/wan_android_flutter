import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget{
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<AccountPage>{
  @override
  Widget build(BuildContext context) {
    return Text("账户");
  }
}