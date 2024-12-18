import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/pages/widgets/articles_list_item_widget.dart';

import '../../models/article_item.dart';
import '../../providers/common/articles_list_provider.dart';

class ArticlesListState<W extends StatefulWidget,
        T extends ArticlesListProvider> extends State<StatefulWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Provider.of<T>(context, listen: false).refreshList();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    if (Provider.of<T>(context, listen: false).hasMoreData) {
      await Provider.of<T>(context, listen: false).loadList();
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<T>(builder: (context, provider, child) {
      List<ArticleItem> list = provider.itemList;
      return Container(
        alignment: Alignment.center,
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext content, int index) {
                var item = list[index];
                // item view
                return ListItem(
                    item: item,
                    index: index,
                    onClick: () {
                      //todo
                    });
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              }),
        ),
      );
    });
  }
}
