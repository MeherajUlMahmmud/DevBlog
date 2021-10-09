class Blog {
  final int id;
  final int uid;
  final String title;
  final String content;
  final int categoryId;
  final String image;
  final String datePosted;
  final int likes;
  final int dislikes;
  final int comments;
  final int views;

  Blog({
    this.id,
    this.uid,
    this.title,
    this.content,
    this.categoryId,
    this.image,
    this.datePosted,
    this.likes,
    this.dislikes,
    this.comments,
    this.views,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      uid: json['uid'],
      title: json['title'],
      content: json['content'],
      categoryId: json['categoryId'],
      image: json['image'],
      datePosted: json['datePosted'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      comments: json['comments'],
      views: json['views'],
    );
  }
}
