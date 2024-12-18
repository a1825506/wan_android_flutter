import 'package:flutter/foundation.dart';

class ApiResult<T>{
  int errorCode;
  String errorMsg;
  T? data;

  ApiResult({
    this.errorCode = 0,
    this.errorMsg = "",
    this.data
});

  factory ApiResult.fromJson(Map<String, dynamic> json, Function(dynamic) fromJsonT) {
    return ApiResult(
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
      // data: fromJsonT(json['data']),
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String,dynamic> toJson() {
    final map = <String,dynamic>{};
    map['data'] = data;
    map['errorMsg'] = errorMsg;
    map['errorCode'] = errorCode;
    return map;
  }
}