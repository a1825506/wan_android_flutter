class SuperUserInfo{
  CoinInfo? coinInfo;
  CollectArticleInfo? collectArticleInfo;
  UserInfo? userInfo;

  SuperUserInfo({
    this.coinInfo,
    this.collectArticleInfo,
    this.userInfo,
  });

  SuperUserInfo.fromJson(dynamic json) {
    coinInfo = json['coinInfo'] != null ? CoinInfo.fromJson(json['coinInfo']) : null;
    collectArticleInfo =
    json['collectArticleInfo'] != null ? CollectArticleInfo.fromJson(json['collectArticleInfo']) : null;
    userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coinInfo != null) {
      map['coinInfo'] = coinInfo?.toJson();
    }
    if (collectArticleInfo != null) {
      map['collectArticleInfo'] = collectArticleInfo?.toJson();
    }
    if (userInfo != null) {
      map['userInfo'] = userInfo?.toJson();
    }
    return map;
  }
}

class UserInfo {
  bool? admin;
  List<dynamic>? chapterTops;
  num? coinCount;
  List<num>? collectIds;
  String? email;
  String? icon;
  num? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  num? type;
  String? username;

  UserInfo({
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  UserInfo.fromJson(dynamic json) {
    admin = json['admin'];
    if (json['chapterTops'] != null) {
      chapterTops = [];
      json['chapterTops'].forEach((v) {
        chapterTops?.add(v);
      });
    }
    coinCount = json['coinCount'];
    collectIds = json['collectIds'] != null ? json['collectIds'].cast<num>() : [];
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    nickname = json['nickname'];
    password = json['password'];
    publicName = json['publicName'];
    token = json['token'];
    type = json['type'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = admin;
    if (chapterTops != null) {
      map['chapterTops'] = chapterTops?.map((v) => v.toJson()).toList();
    }
    map['coinCount'] = coinCount;
    map['collectIds'] = collectIds;
    map['email'] = email;
    map['icon'] = icon;
    map['id'] = id;
    map['nickname'] = nickname;
    map['password'] = password;
    map['publicName'] = publicName;
    map['token'] = token;
    map['type'] = type;
    map['username'] = username;
    return map;
  }
}

class CoinInfo {
  num? coinCount;
  num? level;
  String? nickname;
  String? rank;
  num? userId;
  String? username;

  CoinInfo({
    this.coinCount,
    this.level,
    this.nickname,
    this.rank,
    this.userId,
    this.username,
  });

  CoinInfo.fromJson(dynamic json) {
    coinCount = json['coinCount'];
    level = json['level'];
    nickname = json['nickname'];
    rank = json['rank'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coinCount'] = coinCount;
    map['level'] = level;
    map['nickname'] = nickname;
    map['rank'] = rank;
    map['userId'] = userId;
    map['username'] = username;
    return map;
  }
}

class CollectArticleInfo {
  num? count;

  CollectArticleInfo({
    this.count,
  });

  CollectArticleInfo.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }
}
