import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/chat_repo.dart';

@singleton
class SendMessageByUserIdUseCase {
  final ChatRepo chatRepo;
  SendMessageByUserIdUseCase(this.chatRepo);
  Future<Either<Failure, Unit>> call({
    required SendMessageByUserIdParams params,
  }) => chatRepo.sendMessageByUserId(params: params);
}

class SendMessageByUserIdParams {
  final String userId;
  final String? text;
  final List<File>? media;
  SendMessageByUserIdParams({
    required this.userId,
    required this.text,
    this.media,
  });

  Map<String, dynamic> toMap() => {
    'recipientId': userId,
    if (text != null) 'text': text,
  };

  FormData toFormData() {
    final formData = FormData.fromMap(toMap());
    if (media != null && media!.isNotEmpty) {
      formData.files.addAll(
        media!.map(
          (file) => MapEntry(
            'media',
            MultipartFile.fromFileSync(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        ),
      );
    }
    return formData;
  }
}
