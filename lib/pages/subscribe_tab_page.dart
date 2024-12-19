import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/pages/widgets/articles_list_state.dart';

import '../providers/subscribe_tab_provider.dart';

class SubscribeTabPage extends StatefulWidget{
  final String tabId;

  const SubscribeTabPage({super.key,required this.tabId});

  @override
  State<StatefulWidget> createState() => _SubscribeTabPage();
  }

class _SubscribeTabPage extends ArticlesListState<SubscribeTabPage,SubscribeTabProvider>{
}
