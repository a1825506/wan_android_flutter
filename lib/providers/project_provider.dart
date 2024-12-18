import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/utils/log_utils.dart';

import '../models/articles_tree_item.dart';

class ProjectProvider with ChangeNotifier{
  List<ArticlesTreeItem> tabList = [];
  bool loading = false;
  final WanService _apiService = WanService();

  Future<void> getProjectTree() async {
    loading = true;
    notifyListeners();
     try{
       tabList = await _apiService.getProjectTree();;
     }catch(e){
       LogUtils.logRed(e);
     }finally{
       loading = false;
       notifyListeners();
     }
  }



}