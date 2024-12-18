import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/pages/project_tab_page.dart';
import 'package:wan_android_flutter/providers/project_provider.dart';

import '../common/my_color.dart';
import '../providers/project_Tab_provider_new.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectState();
}

class _ProjectState extends State<ProjectPage> with AutomaticKeepAliveClientMixin{
 @override
  bool get wantKeepAlive => true;

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      //Listen: false 不会在Provider的数据改变时触发 Widget 重建
      Provider.of<ProjectProvider>(context,listen: false).getProjectTree();
    });
  }


  @override
  Widget build(BuildContext context) {
   super.build(context);
   return Consumer<ProjectProvider>(
     builder: (context,provider,child){
       return Container(
         margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
         color: MyColor.wxBackground,
         child: DefaultTabController(
           length: provider.tabList.length,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
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
                       provider.tabList.map((e) {
                         var cid = "${e.id}";
                         return Center(
                           // test
                           // child: Text("${e.name}"),
                           child: ChangeNotifierProvider(
                             create: (_) {
                               // return ProjectTabProvider(cid);
                               return ProjectTabProviderNew(cid);
                             },
                             child: ProjectTabPage(tabId: cid),
                           ),
                         );
                       }).toList(),
                     ),
                   )
               ),
             ],
           ),
         ),
       );
     },
   );
  }
}
