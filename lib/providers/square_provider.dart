import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/models/article_item.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/providers/common/articles_list_provider.dart';

class SquareProvider extends ArticlesListProvider{
  SquareProvider(){
    //广场接口页面从0起
    initFirstPage(0);
    ignoreHasMoreData = true;
  }

  final WanService _apiService = WanService();

  @override
  Future<List<ArticleItem>> fetchArticlesList() {
    return _apiService.getSquareList(firstPage);
  }

}