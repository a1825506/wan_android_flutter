class BannerItem{
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;
  bool collect; // 接口没有返回这个字段

  //构造函数
  BannerItem({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.isVisible,
    required this.order,
    required this.title,
    required this.type,
    required this.url,
    this.collect = false,
});

  //从Json转换为BannerItem
  factory BannerItem.fromJson(Map<String,dynamic> json){
   return BannerItem(
      desc: json['desc'] ?? '', // 默认空字符串
      id: json['id'],
      imagePath: json['imagePath'] ?? '',
      isVisible: json['isVisible'] ?? 0,
      order: json['order'] ?? 0,
      title: json['title'] ?? '',
      type: json['type'] ?? 0,
      url: json['url'] ?? '',
      collect: false, // 这个字段默认是false
    );
  }

  // 转换为Json
  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'id': id,
      'imagePath': imagePath,
      'isVisible': isVisible,
      'order': order,
      'title': title,
      'type': type,
      'url': url,
      'collect': collect,
    };
  }

}
