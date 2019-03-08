class Api{
  static String login = "https://www.yuque.com/login";
  static String event = "https://www.yuque.com/api/events?offset=0";
  static String team = "https://www.yuque.com/api/mine/groups?offset=0&q=";
  static String token = "https://www.yuque.com/api/access_tokens";
  static String bookAllDoc(String id){
    return "https://www.yuque.com/api/docs?book_id=" + id + "&include_last_editor=true&include_share=true&include_user=true";
  }
  static String book(String id){
    return "https://www.yuque.com/api/groups/" + id + "/books?include_summary=true";
  }
  static String bookTopic(String bookId){
    return "https://www.yuque.com/go/book/" + bookId;
  }

  static String bookApi = "https://www.yuque.com/api/mine/books?offset=0&q=";

  static String docApi = "https://www.yuque.com/api/mine/docs?offset=0&limit=15&q=&type=recent_updated";
  static String historyDoc (int offset,int limit){
    return "https://www.yuque.com/api/mine/docs?offset=" + offset.toString() + "&limit=" + limit.toString() + "&type=recent_updated";
  }
  static String news (int offset){
    return "https://www.yuque.com/api/space_posts?offset=" + offset.toString();
  }
  static String getToken = "https://www.yuque.com/api/access_tokens?type=personal";
  static String getTokenInfo(String id){
    return "https://www.yuque.com/api/access_tokens/"+id;
  }

  static String createDoc(String id){
    return "https://www.yuque.com/api/v2/repos/"+id+"/docs";
  }

  static String updateDoc(String repo_id,String docId){
    return "https://www.yuque.com/api/v2/repos/" + repo_id + "/docs/" + docId;
  }

  static String deleteBook(String repoId,String bookId){
    return "https://www.yuque.com/api/v2/repos/$repoId/docs/$bookId";
  }

  static String getBookInfo(String slug,String bookId){
    return "https://www.yuque.com/api/docs/$slug?book_id=$bookId";
  }

  static String getMyInfo(){
    return "https://www.yuque.com/api/v2/user";
  }

  static String unReadNotification = "https://www.yuque.com/api/notifications?offset=0&type=unread";

  static String searchUser(String userName){
    return "https://www.yuque.com/api/zsearch?p=1&q=$userName&scope=%2F&type=user";
  }

  static String getUserInfo(String id){
    return "https://www.yuque.com/api/v2/users/$id";
  }

}