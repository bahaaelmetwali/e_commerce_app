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
                      backgroundColor: AppColors.greyText,
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

              return const SizedBox.shrink();
            },
          ),
        ),
        body: Column(
          spacing: 6,
          children: [
            Expanded(child: ChatBody()),

            MessageInput(),
          ],
        ),
      ),
    );
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetChatByUserIdCubit, GetChatByUserIdState>(
      listener: (context, state) {
        // Auto-scroll when new messages arrive
        if (state is GetChatByUserIdSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        }
      },
      child: BlocBuilder<GetChatByUserIdCubit, GetChatByUserIdState>(
        builder: (context, state) {
          if (state is GetChatByUserIdLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (state is GetChatByUserIdError) {
            return Center(child: Text(state.message));
          }

          if (state is GetChatByUserIdSuccess) {
            final reversedMessages = state.chatDetail.messages.reversed
                .toList();

            return MessagesList(
              messages: reversedMessages,
              scrollController: _scrollController,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  final List<ChatMessageEntity> messages;
  final ScrollController scrollController;

  const MessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
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
