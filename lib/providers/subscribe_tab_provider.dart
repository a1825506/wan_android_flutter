import 'package:wan_android_flutter/models/article_item.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/providers/common/articles_list_provider.dart';

class SubscribeTabProvider extends ArticlesListProvider{

  final String id;
  SubscribeTabProvider(this.id);

  final WanService _apiService = WanService();

  @override
  Future<List<ArticleItem>> fetchArticlesList() {
    // TODO: implement fetchArticlesList
    return _apiService.getSubscribeList(id, firstPage);
  }





}