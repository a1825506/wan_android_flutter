import 'package:flutter/foundation.dart';

class LogUtils{
  static void log(Object? object){
    if(kDebugMode) {
      print(object);
    }
  }

  // 颜色相关，查看 `终端中改变文本的颜色和样式（命令窗口执行脚本的文字输出、IDE 的控制台等）.md`
  static void logRed(Object? object) {
    if (kDebugMode) {
      print('\x1B[31m$object\x1B[0m');
    }
  }
  static void logYellow(Object? object) {
    if (kDebugMode) {
      print('\x1B[33m$object\x1B[0m');
    }
  }
  static void logCyan(Object? object) {
    if (kDebugMode) {
      print('\x1B[36m$object\x1B[0m');
    }
  }

  static void logChunk(Object? object) {
    if (kDebugMode) {
      String message = object.toString();
      // 按长度分割消息，测试到控制台每行最长显示 900 左右
      const int chunkSize = 888;
      for (int i = 0; i < message.length; i += chunkSize) {
        final end =
        (i + chunkSize < message.length) ? i + chunkSize : message.length;
        log(message.substring(i, end));
      }
    }
  }

  static void logChunkRed(Object? object) {
    if (kDebugMode) {
      String message = object.toString();
      // 按长度分割消息，测试到控制台每行最长显示 900
      const int chunkSize = 888;
      for (int i = 0; i < message.length; i += chunkSize) {
        final end =
        (i + chunkSize < message.length) ? i + chunkSize : message.length;
        logRed(message.substring(i, end));
      }
    }
  }
}