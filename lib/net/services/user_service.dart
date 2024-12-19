import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/net/api_path.dart';
import 'package:wan_android_flutter/net/api_service.dart';

import '../../models/user_info.dart';

class UserService extends ApiService {
  //登录接口
  Future<UserInfo>  login(
      String username,
      String password,
      ) async {
    debugPrint("fetch login() username: $username, password:$password");
    UserInfo userInfo = await request(
        method: "post",
        path: ApiPath.userLogin,
        fromJsonT: (json){
          return UserInfo.fromJson(json);
        }
    );
    return userInfo;
  }

  //退出登录
  Future<Object?> logout() async {
    debugPrint("logout()");
    Object? result = await request(
      method: "get",
      path: ApiPath.userLogout,
      fromJsonT: (json) {
        return json;
      },
    );
    return result;
  }

  //获取用户信息
  Future<SuperUserInfo> getUserInfo() async {
    debugPrint("getUserInfo()");
    SuperUserInfo userInfo = await request(
      method: "get",
      path: ApiPath.userInfo,
      fromJsonT: (json) {
        return SuperUserInfo.fromJson(json);
      },
    );
    return userInfo;
  }
}