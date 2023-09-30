class UserModel {
  final String? photo; // URL to user's profile photo
  final String? email; // User's email address
  final String? uid; // User's unique ID
  final bool? isEmailVerified; // Whether the user's email is verified

  UserModel({
    this.photo,
    this.email,
    this.uid,
    this.isEmailVerified,
  });

}