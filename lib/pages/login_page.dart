import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/providers/user_provider.dart';

import '../common/my_color.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() =>_LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    if(_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      Provider.of<UserProvider>(context,listen: false).login(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context,provider,child) {
          if(provider.superUserInfo != null ){
            //登录成功 可以导航到其他页面
            Navigator.pop(context);
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('登录'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "用户名",
                          // 设置聚焦时的边框样式
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColor.iconColorFore, width: 2.0),
                          ),
                          // 设置非聚焦时的边框样式
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return '请输入用户名';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "密码",
                          // 设置聚焦时的边框样式
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColor.iconColorFore, width: 2.0),
                          ),
                          // 设置非聚焦时的边框样式
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请输入密码';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24,),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.iconColorFore,
                            foregroundColor: Colors.white
                          ),
                          onPressed: _login,
                          child: Text("登录"),
                        ),
                      )
                    ],
                  ),
              ),
            ),

          );
        }
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}