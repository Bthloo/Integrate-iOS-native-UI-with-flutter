class PostsModel {
  List<PostModel>? posts;
  int? total;
  int? skip;
  int? limit;

  PostsModel({this.posts, this.total, this.skip, this.limit});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <PostModel>[];
      json['posts'].forEach((v) {
        posts!.add(PostModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }


 static PostsModel convertToPostsModel(Map<String, dynamic> data) {

    List<Map<String, dynamic>> postData = (data['posts'] as List).map((post) {
      return {
        'id': 0, // Default ID since it's not provided
        'title': post['userName'], // Map userName to title
        'body': post['postText'], // Map postText to body
        'tags': <String>[], // Default empty list of tags
        'reactions': {
          'likes': post["likesCount"], // Default likes
          'dislikes': 0, // Default dislikes
        },
        'views': post["views"], // Default views
        'userId': 1, // Default userId
      };
    }).toList();

    // Wrap posts into a PostsModel
    return PostsModel.fromJson({
      'posts': postData,
      'total': postData.length,
      'skip': 0,
      'limit': 10,
    });
  }
}
class PostModel {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  PostModel(
      {this.id,
        this.title,
        this.body,
        this.tags,
        this.reactions,
        this.views,
        this.userId});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'] != null
        ? Reactions.fromJson(json['reactions'])
        : null;
    views = json['views'];
    userId = json['userId'];
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

}
