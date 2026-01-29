import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/features/chat/presentation/cubits/get_chat_by_user_id/get_chat_by_user_id_cubit.dart';
import 'package:mega/app/features/chat/presentation/cubits/send_by_chat_id/send_by_chat_id_cubit.dart';
import 'package:mega/app/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:mega/app/features/chat/presentation/widgets/message_input.dart';
import '../../../core/di/injection.dart';
import '../../../material/images/app_image_widget.dart';
import '../domain/entities/chat_message_entity.dart';

class ChatScreen extends StatelessWidget {
  final String userId;
  const ChatScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<GetChatByUserIdCubit>()..fetchChatByUserId(userId),
        ),
        BlocProvider(create: (_) => getIt<SendByChatIdCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.chatColor,
        appBar: AppBar(
          title: BlocBuilder<GetChatByUserIdCubit, GetChatByUserIdState>(
            builder: (context, state) {
              if (state is GetChatByUserIdSuccess) {
                final user = state.chatDetail.otherUser;

                return Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: AppImageWidget(
                          path: user.avatar,
                          canCache: true,
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(user.name),
                  ],
                );
              }

              // loading / initial / error
              return const SizedBox.shrink();
            },
          ),
        ),
        body: Column(
          spacing: 6,
          children: [
            Expanded(child: const ChatBody()),

            MessageInput(),
          ],
        ),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetChatByUserIdCubit, GetChatByUserIdState>(
      builder: (context, state) {
        if (state is GetChatByUserIdLoading) {
          return const Center(child: CircularProgressIndicator(
            color: AppColors.primaryColor ,
          ));
        }

        if (state is GetChatByUserIdError) {
          return Center(child: Text(state.message));
        }

        if (state is GetChatByUserIdSuccess) {
          final reversedMessages = state.chatDetail.messages.reversed.toList();

          return MessagesList(messages: reversedMessages);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class MessagesList extends StatelessWidget {
  final List<ChatMessageEntity> messages;

  const MessagesList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatBubble(message: message);
      },
    );
  }
}
