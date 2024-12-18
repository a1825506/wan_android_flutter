import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/utils/log_utils.dart';

import '../models/article_item.dart';
import '../models/banner_item.dart';

class HomeProvider with ChangeNotifier{
  List<BannerItem> bannerList = [];
  List<ArticleItem> itemList = [];
  int firstPage = 0;
  int currentPage = 0;
  bool isLoading = false;
  bool hasMoreData = true;

  HomeProvider(){}

  final WanService _apiService = WanService();

  Future<void> loadList() async {
    if(isLoading || !hasMoreData) return;
    isLoading = true;
    notifyListeners();
    try{
      List<ArticleItem> list;
      if(currentPage == firstPage) {
        //首次加载、刷新
        //banner
        List<BannerItem> bannerList = await _apiService.getBannerList();
        this.bannerList = bannerList;
        //列表
        List<ArticleItem> topList = await _apiService.getHomeTopList();
        list = await _apiService.getHomeList(currentPage);
        itemList.clear(); // 放在获取数据后，不然 UI 列表会短暂清空
        itemList.addAll(topList);
        itemList.addAll(list);
      }else{
        //加载更多
        list = await _apiService.getHomeList(currentPage);
        itemList.addAll(list);
      }
      if (list.length < 10) {
        hasMoreData = false;
      } else {
        currentPage++;
      }

    }catch(e){
      LogUtils.logRed(e);
    }finally{
      notifyListeners();
    }
  }

  Future<void> refreshList() async {
    currentPage = firstPage;
    hasMoreData = true;
    await loadList(); // 重新加载第一页数据
  }



}