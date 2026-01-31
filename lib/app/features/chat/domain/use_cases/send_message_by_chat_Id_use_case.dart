// ignore: file_names
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/repos/chat_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class SendMessageByChatIdUseCase {
  final ChatRepo chatRepo;
  SendMessageByChatIdUseCase(this.chatRepo);
  Future<Either<Failure, Unit>> call({
    required SendMessageByChatIdParams params,
  }) => chatRepo.sendMessageByChatId(params: params);
}

class SendMessageByChatIdParams {
  final String chatId;
  final String? text;
  final List<File>? media;

  SendMessageByChatIdParams({required this.chatId, this.text, this.media});

  Map<String, dynamic> toMap() => {
        'chatId': chatId,
        if (text != null) 'text': text,
      };

  FormData toFormData() {
    final formData = FormData.fromMap(toMap());
    if (media != null && media!.isNotEmpty) {
      formData.files.addAll(
        media!.map(
          (file) => MapEntry(
            'media',
            MultipartFile.fromFileSync(file.path, filename: file.path.split('/').last),
          ),
        ),
      );
    }
    return formData;
  }
}
