import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/project_page.dart';
import 'package:wan_android_flutter/pages/square_page.dart';
import 'package:wan_android_flutter/pages/subscribe_page.dart';

import 'account_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  //底部导航控制器
  late TabController controller;

  @override
  void initState() {
    super.initState();
    //初始化底部导航控制器
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    //销毁
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return myScaffold();
  }

  Scaffold myScaffold() =>
      Scaffold(
        bottomNavigationBar: Container(
          color: Colors.grey[100],
          child: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                text: '首页',
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                text: '项目',
                icon: Icon(Icons.business_center_outlined),
              ),
              Tab(
                text: '广场',
                icon: Icon(Icons.crop_square),
              ),
              Tab(
                text: '订阅',
                icon: Icon(Icons.subscript_outlined),
              ),
              Tab(
                text: '我的',
                icon: Icon(Icons.manage_accounts_outlined),
              ),
            ],
          ),
        ),
        body: Container(
          // TabBarView 与 TabBar 配合使用的组件，通常用于创建多个页面之间的切换效果。它使用滑动手势或点击 TabBar 来实现页面切换。
          child: TabBarView(
            controller: controller,
            // 禁止滑动
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              ProjectPage(),
              SquarePage(),
              SubscribePage(),
              AccountPage(),
            ],
          ),
        ),
      );
}
