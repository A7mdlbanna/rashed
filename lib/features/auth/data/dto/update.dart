import 'package:dio/dio.dart';

class UpdateDTO {
  UpdateDTO({
    this.email,
    this.username,
    this.jobTitle,
    this.goal,
    this.image,
    this.syncedWithGoogle,
    this.allowNotification,
  });

  final String? email;
  final String? username;
  final String? jobTitle;
  final String? goal;
  final String? image;
  final bool? syncedWithGoogle;
  final bool? allowNotification;

  Future<FormData> toFormData() async {
    final map = {
      if(email != null) 'email': email,
      if(username != null) 'username': username,
      if(jobTitle != null) 'job_title': jobTitle,
      if(goal != null) 'goal': goal,
      if(syncedWithGoogle != null) 'synced_with_google': syncedWithGoogle,
      if(allowNotification != null) 'allow_notifications': allowNotification,
    };
    final formData = FormData.fromMap(map);
    if(image != null) formData.files.add(MapEntry('image', await MultipartFile.fromFile(image!)));
    return formData;
  }
}