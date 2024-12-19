import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/utils/log_utils.dart';

import '../models/articles_tree_item.dart';

class SubscribeProvider with ChangeNotifier{
  List<ArticlesTreeItem> tabList = [];
  bool loading = false;

  final WanService _apiService = WanService();

  Future<void> getSubscribeTree() async {
    loading = true;
    notifyListeners();

    try {
      tabList = await _apiService.getSubscribeTree();
    }catch(e) {
      LogUtils.logRed(e);
    }finally {
      loading = false;
      notifyListeners();
    }
  }

}