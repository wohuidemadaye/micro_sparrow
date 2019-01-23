class Api{
  static String login = "https://www.yuque.com/login";
  static String event = "https://www.yuque.com/api/events?offset=0";
  static String team = "https://www.yuque.com/api/mine/groups?offset=0&q=";
  static String token = "https://www.yuque.com/api/access_tokens";
  static String book(String id){
    return "https://www.yuque.com/api/groups/" + id + "/books?include_summary=true";
  }
  static String bookTopic(String bookId){
    return "https://www.yuque.com/go/book/" + bookId;
  }

  static String bookApi = "https://www.yuque.com/api/mine/books?offset=0&q=";

  static String docApi = "https://www.yuque.com/api/mine/docs?offset=0&limit=15&q=&type=recent_updated";
  static String historyDoc = "https://www.yuque.com/api/mine/docs?offset=0&limit=15&type=recent_updated";
  static String news = "https://www.yuque.com/api/space_posts?offset=0";

}