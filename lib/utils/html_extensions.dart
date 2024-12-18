// dart 扩展方法

// html 字符 decode encode
// todo 替代方案 https://pub.dev/packages/html
// todo 替代方案 https://pub.dev/packages/html_character_entities
extension HtmlExtensions on String {
  // 参考 `android.text.TextUtils.htmlEncode`
  String htmlDecode() {
    return this
            .replaceAll("&lt;", "<")
            .replaceAll("&gt;", ">")
            .replaceAll("&amp;", "&")
            .replaceAll("&#39;", "'")
            //http://www.w3.org/TR/xhtml1
            // The named character reference &apos; (the apostrophe, U+0027) was introduced in
            // XML 1.0 but does not appear in HTML. Authors should therefore use &#39; instead
            // of &apos; to work as expected in HTML 4 user agents.
            // 兼容 &apos;
            .replaceAll("&apos;", "'")
            .replaceAll("&quot;", "\"")
            //
            .replaceAll("&ldquo;", "“") // U+201C
            .replaceAll("&rdquo;", "”") // U+201D
            .replaceAll("&lsquo;", "‘") // U+2018
            .replaceAll("&rsquo;", "’") // U+2019
            //
            .replaceAll("&mdash;", "—") // U+2014
        ;
  }

  // 参考 `android.text.TextUtils.htmlEncode`
  String htmlEncode() {
    final StringBuffer sb = StringBuffer();
    for (int i = 0; i < this.length; i++) {
      final char = this[i];
      switch (char) {
        case '<':
          sb.write("&lt;");
          break;
        case '>':
          sb.write("&gt;");
          break;
        case '&':
          sb.write("&amp;");
          break;
        case '\'':
          // HTML 4 中 `&apos;` 不被支持，使用 `&#39;` 代替
          sb.write("&#39;");
          break;
        case '"':
          sb.write("&quot;");
          break;
        default:
          sb.write(char);
      }
    }
    return sb.toString();
  }
}
