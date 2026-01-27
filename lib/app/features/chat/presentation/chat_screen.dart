import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/chat/presentation/cubits/get_ch/get_chat_by_user_id_cubit.dart';
import 'package:mega/app/features/chat/presentation/widgets/message_input.dart';
import '../../../core/di/injection.dart';
import '../../../material/images/app_image_widget.dart';
import '../domain/entities/chat_message_entity.dart';

class ChatScreen extends StatelessWidget {
  final String userId;
  const ChatScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetChatByUserIdCubit>()..fetchChatByUserId(userId),
      child: Scaffold(
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
        body: const ChatBody(),
        bottomNavigationBar: MessageInput(onSend: (_) {}),
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
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetChatByUserIdError) {
          return Center(child: Text(state.message));
        }

        if (state is GetChatByUserIdSuccess) {
          return MessagesList(messages: state.chatDetail.messages);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class MessagesList extends StatelessWidget {
  final List<ChatMessageEntity> messages;

  const MessagesList({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Row(
          mainAxisAlignment: message.isMine
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.85,
                ),
                decoration: BoxDecoration(
                  color: message.isMine ? Colors.blue : Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: Radius.circular(message.isMine ? 16 : 0),
                    bottomRight: Radius.circular(message.isMine ? 0 : 16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.text,
                      style: TextStyle(
                        color: message.isMine ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Spacer(),
                    //       Text(
                    //         '10:45 AM',
                    //         style: TextStyle(
                    //           fontSize: 11,
                    //           color: message.isMine
                    //               ? Colors.white70
                    //               : Colors.black54,
                    //         ),
                    //       ),
                    //       SizedBox(width: 4),
                    //       Icon(
                    //         Icons.check,
                    //         size: 12,
                    //         color: message.isMine
                    //             ? Colors.white70
                    //             : Colors.black54,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
