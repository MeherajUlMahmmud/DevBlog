import 'package:DevBlog/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUserInformation(UserProfile userProfile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('id', userProfile.user.id);
    prefs.setString('name', userProfile.user.name);
    prefs.setString('email', userProfile.user.email);
    prefs.setString('token', userProfile.user.token);
    prefs.setString(
        "imageUrl",
        userProfile.profile.imageUrl == null
            ? ""
            : userProfile.profile.imageUrl);
    prefs.setString("gender",
        userProfile.profile.gender == null ? "" : userProfile.profile.gender);
    prefs.setString(
        "dateOfBirth",
        userProfile.profile.dateOfBirth == null
            ? ""
            : userProfile.profile.dateOfBirth);
    prefs.setString(
        "followers",
        userProfile.profile.followers == null
            ? ""
            : userProfile.profile.followers);
    prefs.setString(
        "followings",
        userProfile.profile.followings == null
            ? ""
            : userProfile.profile.followings);
    prefs.setString(
        "viewCount",
        userProfile.profile.viewCount == null
            ? ""
            : userProfile.profile.viewCount);

    return prefs.commit();
  }

  Future<UserProfile> getUserInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String id = prefs.getString("id");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String token = prefs.getString("token");
    User user = User(id: id, name: name, email: email, token: token);

    String imageUrl = prefs.getString("imageUrl");
    String gender = prefs.getString("gender");
    String dateOfBirth = prefs.getString("dateOfBirth");
    String followers = prefs.getString("followers");
    String followings = prefs.getString("followings");
    String viewCount = prefs.getString("viewCount");
    Profile profile = Profile(
      imageUrl: imageUrl,
      gender: gender,
      dateOfBirth: dateOfBirth,
      followers: followers,
      followings: followings,
      viewCount: viewCount,
    );

    return UserProfile(
      user: user,
      profile: profile,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('token');

    prefs.remove('imageUrl');
    prefs.remove('gender');
    prefs.remove('dateOfBirth');
    prefs.remove('followers');
    prefs.remove('followings');
    prefs.remove('viewCount');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
