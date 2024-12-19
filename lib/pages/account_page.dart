import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/common/my_color.dart';
import 'package:wan_android_flutter/providers/user_provider.dart';
import 'package:wan_android_flutter/utils/user_utils.dart';

import '../utils/toast_utils.dart';
import 'login_page.dart';

class AccountPage extends StatefulWidget{
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<AccountPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    //获取网络接口最新数据
    Provider.of<UserProvider>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<UserProvider>(
        builder: (context,provider,child){
          return Container(
            color: MyColor.wxBackground,
            child: ListView(
              children: [
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: () async {
                      var isLogin = await UserUtils.isLogin();
                      if (!isLogin) {
                        // 异步代码，先检查小部件是否仍在 widget 树中
                        if (!mounted) return;
                        var result = Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        result.then((result) => {
                          // 处理页面返回结果
                          if (result != null)
                            {
                               // ToastUtils.show(result),
                            }
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          SizedBox(width: 30,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/splash_1080.jpg",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 50),
                              Text(
                                provider.superUserInfo?.userInfo?.nickname ?? "未登录",
                                style: TextStyle(fontSize: 18,color: MyColor.primaryText),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "用户名：${provider.superUserInfo?.userInfo?.username ?? "null"}",
                                    style: TextStyle(fontSize: 14,color: MyColor.primaryText),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "id: ${provider.superUserInfo?.userInfo?.id ?? "-1"}",
                                    style: TextStyle(fontSize: 14, color: MyColor.secondaryText),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Text(
                                "邮箱：${provider.superUserInfo?.userInfo?.email ?? "null"}",
                                style: TextStyle(fontSize: 14, color: MyColor.secondaryText),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                          Spacer(flex: 1),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: (){
                      // ToastUtils.show("积分排行");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_conan_selected.png",
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "积分排行",
                            style: TextStyle(fontSize: 16, color: MyColor.primaryText),
                          ),
                          Spacer(flex: 1),
                          Text(
                            "积分:${provider.superUserInfo?.coinInfo?.coinCount ?? "-1"}",
                            style: TextStyle(fontSize: 14,color: MyColor.secondaryText),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "排行：${provider.superUserInfo?.coinInfo?.rank ?? "-1"}",
                            style: TextStyle(fontSize: 14,color: MyColor.secondaryText),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: (){
                      // ToastUtils.show("收藏文章");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_article.png",
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "收藏文章",
                            style: TextStyle(fontSize: 16,color: MyColor.primaryText),
                          ),
                          Spacer(flex: 1),
                          Text(
                            "收藏量：99篇",
                            style: TextStyle(fontSize: 14,color: MyColor.secondaryText),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.5),
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: (){
                      // ToastUtils.show("分享文章");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_share.png",
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "分享文章",
                            style: TextStyle(fontSize: 16,color: MyColor.primaryText),
                          ),
                          Spacer(flex: 1),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.5),
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: (){
                      // ToastUtils.show("收藏网站");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_site.png",
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "收藏网站",
                            style: TextStyle(fontSize: 16,color: MyColor.primaryText),
                          ),
                          Spacer(flex: 1),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ColoredBox(
                    color: MyColor.wxBackground,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_settings.png",
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            "设置",
                            style: TextStyle(fontSize: 16,color: MyColor.primaryText),
                          ),
                          Spacer(flex: 1,),
                          Image.asset(
                            "assets/images/icon_arrow_right.png",
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1,),
              ],
            ),
          );
        }
    );
  }


}