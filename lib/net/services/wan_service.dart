import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/models/banner_item.dart';
import 'package:wan_android_flutter/net/api_path.dart';
import 'package:wan_android_flutter/net/api_service.dart';

import '../../models/article_item.dart';

class WanService extends ApiService{

  //获取首页轮播图
  Future<List<BannerItem>> getBannerList() async{
    debugPrint("fetch getBannerList()");
    List<BannerItem> bannerList = await request(
        method: 'get',
        path: ApiPath.banner,
        fromJsonT: (json){
          List<dynamic> data = json;
          return data.map((e) => BannerItem.fromJson(e)).toList();
        },
    );
    return bannerList;
  }


  Future<List<ArticleItem>> getHomeTopList() async {
    debugPrint("fetch getHomeTopList()");
    List<ArticleItem> itemList = await request(
      method: "get",
      path: ApiPath.homeTopList,
      fromJsonT: (json) {
        List<dynamic> data = json;
        return data.map((e) => ArticleItem.fromJson(e)).toList();
      },
    );
    return itemList;
  }

  Future<List<ArticleItem>> getHomeList(
      int page,
      ) async {
    debugPrint("fetch getHomeList(page: ${page})");
    List<ArticleItem> itemList = await request(
        method: "get",
        path: ApiPath.homeList(page),
        paramsMap: {"page_size": 10},
        fromJsonT: (json) {
          List<dynamic> list = json["datas"];
          return list.map((e) => ArticleItem.fromJson(e)).toList();
        });
    return itemList;
  }
}