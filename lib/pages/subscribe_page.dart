import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/pages/subscribe_tab_page.dart';

import '../common/my_color.dart';
import '../providers/subscribe_provider.dart';
import '../providers/subscribe_tab_provider.dart';

class SubscribePage extends StatefulWidget{
  const SubscribePage({super.key});

  @override
  State<StatefulWidget> createState() => _SubscribeState();
}

class _SubscribeState extends State<SubscribePage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // listen: false：不会在 Provider 的数据改变时触发 Widget 重建
      Provider.of<SubscribeProvider>(context, listen: false).getSubscribeTree();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<SubscribeProvider>(
        builder: (context,provider,child){
          return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: MyColor.wxBackground,
            child: DefaultTabController(
              length: provider.tabList.length,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //tab
                  ColoredBox(
                    color: Colors.white,
                    child: TabBar(
                      isScrollable: true,
                      tabs: provider.tabList.map((e) => Tab(text: e.name)).toList(),
                    ),
                  ),

                  Expanded(
                    child: ColoredBox(
                      color: MyColor.wxBackground,
                      child: TabBarView(
                        children:
                        // provider.tabList.map((e) => myTabPager(e)).toList()
                        provider.tabList.map((e) {
                          var id = "${e.id}";
                          return Center(
                            // test
                            // child: Text("${e.name}"),
                            child: ChangeNotifierProvider(
                              create: (_) {
                                return SubscribeTabProvider(id);
                              },
                              child: SubscribeTabPage(tabId: id),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


}