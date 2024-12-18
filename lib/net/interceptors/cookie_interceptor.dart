import 'package:dio/dio.dart';
import 'package:wan_android_flutter/utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    String? cookies = await SpUtils.getString("cookies");
    if (cookies != null && cookies.isNotEmpty) {
      options.headers['Cookie'] = cookies;
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var setCookies = response.headers["set-cookie"];
    if (setCookies != null) {
      String cookies = setCookies.join('; ');
      SpUtils.setString("cookies", cookies);
    }
    return handler.next(response);
  }
}