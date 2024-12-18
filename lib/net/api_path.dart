class ApiPath{
  static const String baseUrl = "https://www.wanandroid.com";
  // 注册
  static const String userRegister = '/user/register';
  // 登录
  static const String userLogin = '/user/login';
  // 登出
  static const String userLogout = '/user/logout/json';
  // 个人信息接口
  static const String userInfo = '/user/lg/userinfo/json';
  // 未读消息数量
  static const String unreadMessageCount = '/message/lg/count_unread/json';
  // 已读消息列表
  static String readMessageList(int page) => '/message/lg/readed_list/$page/json';
  // 未读消息列表
  static String unreadMessageList(int page) => '/message/lg/unread_list/$page/json';
  // 首页
  static const String banner = "/banner/json";
  static const String homeTopList = "/article/top/json";
  static String homeList(int page) => '/article/list/$page/json';
  // 项目
  static const String projectTree = "/project/tree/json";
  static String projectList(int page) => '/project/list/$page/json';
  static String newProjectList(int page) => '/article/listproject/$page/json';
  // 公众号
  static const String wxArticleTree = "/wxarticle/chapters/json";
  static String wxArticleList(String id, int page) => '/wxarticle/list/$id/$page/json';
  static String searchWxArticleList(int id, String k, int page) => '/wxarticle/list/$id/$page/json?k=$k';
  // 搜索
  static String search(int page) => '/article/query/$page/json';
  // 问答
  static String qaList(int page) => '/wenda/list/$page/json';
  static String qaCommentList(int id) => '/wenda/comments/$id/json';
  // 广场
  static String squareList(int page) => '/user_article/list/$page/json';
  static String userShareList(int id, int page) => '/user/$id/share_articles/$page/json';
  static String myShareList(int page) => '/user/lg/private_articles/$page/json';
  static String deleteMyShare(int id) => '/lg/user_article/delete/$id/json';
  static const String shareArticle = '/lg/user_article/add/json';
}