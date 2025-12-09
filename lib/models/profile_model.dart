class ProfileModel {
  final String uid;
  final String displayName;
  final String email;
  final String? phoneNumber;
  final String? bio;
  final String? photoUrl;
  final DateTime updatedAt;

  ProfileModel({
    required this.uid,
    required this.displayName,
    required this.email,
    this.phoneNumber,
    this.bio,
    this.photoUrl,
    required this.updatedAt,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      uid: map['uid'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'],
      bio: map['bio'],
      photoUrl: map['photoUrl'],
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'photoUrl': photoUrl,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  ProfileModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? bio,
    String? photoUrl,
    DateTime? updatedAt,
  }) {
    return ProfileModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}