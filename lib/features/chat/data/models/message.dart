import 'package:equatable/equatable.dart';

class Message extends Equatable {
  Message({
    this.id,
    this.content,
    this.isFromBot = false,
    this.type,
    this.createdAt,});

  Message.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    isFromBot = json['isFromBot'] ?? true;
    type = json['type'];
    createdAt = DateTime.tryParse(json['createdAt'] ?? '');
  }
  String? id;
  String? content;
  bool isFromBot = false;
  String? type;
  DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['isFromBot'] = isFromBot;
    map['type'] = type;
    map['createdAt'] = createdAt;
    return map;
  }

  Map<String, dynamic> toDto() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['type'] = type;
    map['messageReturn'] = false;
    map['metadata'] = {};
    return map;
  }

  @override
  List<Object?> get props => [id];

}