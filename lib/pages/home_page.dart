import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/common/my_color.dart';
import 'package:wan_android_flutter/pages/widgets/articles_list_item_widget.dart';
import 'package:wan_android_flutter/pages/widgets/banner_widget.dart';
import 'package:wan_android_flutter/providers/home_provider.dart';

import '../models/article_item.dart';
import '../models/banner_item.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomeState();

}
/**
 * AutomaticKeepAliveClientMixin 保持页面状态（State）的持久化
 * 通常用于与 PageView 或 TabBarView 一起使用，确保在页面切换时不会销毁已经加载的页面。
 */
class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: MyColor.wxBackground,
      child: HomeContainerPage(),
    );
  }
}

class HomeContainerPage extends StatefulWidget{
  const HomeContainerPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageContainerPage();
}

class _HomePageContainerPage extends State<HomeContainerPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    // 调用 provider 的 resetList 方法来刷新数据
    await Provider.of<HomeProvider>(context, listen: false).refreshList();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    if (Provider.of<HomeProvider>(context, listen: false).hasMoreData) {
      await Provider.of<HomeProvider>(context, listen: false).loadList();
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(
      builder: (context,provider,child){
        List<BannerItem> bannerList = provider.bannerList;
        List<ArticleItem> itemList = provider.itemList;

        return Container(
          alignment: Alignment.center,
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.separated(
                itemCount:itemList.length +  1,
              itemBuilder: (BuildContext content,int index){
                  if(index == 0){
                    //banner view
                    return BannerWidget(
                        bannerList: bannerList,
                        onClick: (item){

                        }
                        );
                  }else{
                    var item = itemList[index - 1]; // 减去 Banner 的位置
                    // item view
                    return ListItem(
                      item: item,
                      index: index,
                      onClick: () {
                        // todo
                        // ToastUtils.show("item link = ${item.link}");
                      },
                    );
                  }
              },
              separatorBuilder:(BuildContext content,int index) {
                  return SizedBox(height: 10);
              },
            ),
          ),
        );
      },
    );
  }
}