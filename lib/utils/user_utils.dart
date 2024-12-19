import 'dart:convert';

import 'package:wan_android_flutter/models/user_info.dart';
import 'package:wan_android_flutter/utils/log_utils.dart';
import 'package:wan_android_flutter/utils/sp_utils.dart';

class UserUtils {
  static saveUserInfo(SuperUserInfo superUserInfo) {
    var json = superUserInfo.toJson();
    var jsonStr = jsonEncode(json);
    //加密处理
    SpUtils.setString("SuperUserInfo", jsonStr);
  }

  static Future<SuperUserInfo?> getUserInfo() async {
    var jsonStr = await SpUtils.getString("SuperUserInfo");
    if (jsonStr ==null){
      return null;
    }
    //解密处理
    var json = jsonDecode(jsonStr);
    try{
      return SuperUserInfo.fromJson(json);
    }catch(e) {
      LogUtils.logRed(e);
      return null;
    }
  }

  static clear(){
    SpUtils.remove("SuperUserInfo");
    SpUtils.remove("cookies");
  }

  static Future<bool> isLogin() async {
    var superUserInfo = await getUserInfo();
    return superUserInfo?.userInfo != null && superUserInfo?.userInfo?.id != null;
  }
}