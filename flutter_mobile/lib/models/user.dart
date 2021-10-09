class User {
  final int id;
  final String name;
  final String email;
  final String slug;
  final String token;
  final bool isActive;
  
  User({this.id, this.name, this.email, this.slug, this.token, this.isActive});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      slug: json['slug'],
      token: json['token'],
      isActive: json['is_active'],
    );
  }
}

class Profile {
  final int id;
  final int uid;
  final String image;
  final String gender;
  final String dateOfBirth;
  final int followers;
  final int followings;
  final int viewCount;

  Profile({this.id, this.uid, this.image, this.gender this.dateOfBirth, this.followers, this.followings, this.viewCount});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      uid: json['uid'],
      image: json['image'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      followers: json['followers'],
      followings: json['followings'],
      viewCount: json['viewCount'],
    );
  }
}
