import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/providers/account_provider.dart';
import 'package:wan_android_flutter/providers/home_provider.dart';
import 'package:wan_android_flutter/providers/project_provider.dart';
import 'package:wan_android_flutter/providers/square_provider.dart';
import 'package:wan_android_flutter/providers/subscribe_provider.dart';
import 'package:wan_android_flutter/providers/user_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //注册ChangeNotifier
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(create: (context) => SquareProvider()),
        ChangeNotifierProvider(create: (context) => SubscribeProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child:    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

