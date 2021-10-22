class User {
  final String id;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['slug'] = this.slug;
    data['token'] = this.token;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Profile {
  final String id;
  final String uid;
  final String imageUrl;
  final String gender;
  final String dateOfBirth;
  final String followers;
  final String followings;
  final String viewCount;

  Profile({this.id, this.uid, this.imageUrl, this.gender, this.dateOfBirth, this.followers, this.followings, this.viewCount});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      uid: json['uid'],
      imageUrl: json['image'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      followers: json['followers'],
      followings: json['followings'],
      viewCount: json['viewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['image'] = this.imageUrl;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['followers'] = this.followers;
    data['followings'] = this.followings;
    data['viewCount'] = this.viewCount;
    return data;
  }
}

class UserProfile {
  User user;
  Profile profile;

  UserProfile({this.user, this.profile});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      user: User.fromJson(json['user']),
      profile: Profile.fromJson(json['profile']),
    );
  }
}
