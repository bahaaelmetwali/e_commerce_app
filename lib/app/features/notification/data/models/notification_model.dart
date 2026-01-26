import 'dart:convert';
import '../../domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.message,
    required super.type,
    required super.data,
    required super.isRead,
    required super.createdAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['_id'] as String,
      userId: map['user'] as String,
      title: map['title'] as String,
      message: map['message'] as String,
      type: NotificationTypeEnum.fromString(map['type'] as String),
      data: Map<String, dynamic>.from(map['data'] as Map),
      isRead: map['isRead'] as bool,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'user': userId,
      'title': title,
      'message': message,
      'type': type,
      'data': data,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      userId: userId,
      title: title,
      message: message,
      type: type,
      data: data,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}
