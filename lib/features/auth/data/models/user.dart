class User {
  int? id;
  String? email;
  String? username;
  String? jobTitle;
  String? goal;
  bool? allowNotifications;
  String? image;
  String? dateJoined;
  bool isActive;
  List<dynamic>? tokens;
  bool googleCalendarSynced;

  User({
    this.id,
    this.email,
    this.username,
    this.jobTitle,
    this.goal,
    this.allowNotifications,
    this.image,
    this.dateJoined,
    this.isActive = false,
    this.tokens,
    this.googleCalendarSynced = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    username: json['username'],
    jobTitle: json['job_title'],
    goal: json['goal'],
    allowNotifications: json['allow_notifications'],
    image: json['image'],
    dateJoined: json['date_joined'],
    isActive: json['is_active'] ?? false,
    tokens: json['tokens'] ?? [],
    googleCalendarSynced: json['synced_with_google'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'username': username,
    'job_title': jobTitle,
    'goal': goal,
    'allow_notifications': allowNotifications,
    'image': image,
    'date_joined': dateJoined,
    'is_active': isActive,
    'tokens': tokens,
    'synced_with_google': googleCalendarSynced,
  };
}