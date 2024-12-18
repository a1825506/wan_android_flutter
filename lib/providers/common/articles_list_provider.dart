import 'package:flutter/material.dart';
import 'package:wan_android_flutter/utils/log_utils.dart';

import '../../models/article_item.dart';

abstract class ArticlesListProvider with ChangeNotifier{
  List<ArticleItem> itemList = [];
  int firstPage = 1;
  int currentPage = 0;
  bool isLoading = false;
  bool hasMoreData = true;
  // fixme 有的接口返回列表条数跟参数设定不一致，只好忽略处理
  bool ignoreHasMoreData = false;

  //接口方法 抽象方法，需要子类实现，调用不同的接口获取文章列表数据
  Future<List<ArticleItem>> fetchArticlesList();

  initFirstPage(int firstPage) {
    this.firstPage = firstPage;
    currentPage = firstPage;
  }

  Future<void> loadList() async {
    if(isLoading || !hasMoreData) return;

    isLoading = true;
    notifyListeners();

    try{
      List<ArticleItem> list = await fetchArticlesList();
      if(currentPage == firstPage) {
        itemList.clear();
      }
      itemList.addAll(list);

      if(list.length < 10 && !ignoreHasMoreData){
        hasMoreData = false;
      }else {
        currentPage++;
      }
    }catch(e){
      LogUtils.logRed(e);
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshList() async {
    currentPage = firstPage;
    hasMoreData = true;
    await loadList(); // 重新加载第一页数据
  }


}