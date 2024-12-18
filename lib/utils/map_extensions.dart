extension HtmlExtensions on Map<String, dynamic> {
  String toUrlEncodedString() {
    final paramsList = this.entries.map((entry) {
      return "${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}";
    }).toList();
    return paramsList.join("&");
  }
}
