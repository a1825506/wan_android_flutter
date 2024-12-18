import 'package:wan_android_flutter/models/article_item.dart';
import 'package:wan_android_flutter/net/services/wan_service.dart';
import 'package:wan_android_flutter/providers/common/articles_list_provider.dart';

class ProjectTabProviderNew extends ArticlesListProvider{
  final String cid;
  final WanService _apiService = WanService();
  ProjectTabProviderNew(this.cid);

  @override
  Future<List<ArticleItem>> fetchArticlesList() {
    return _apiService.getProjectList(cid, currentPage);
  }


}