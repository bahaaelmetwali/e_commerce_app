import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/features/chat/presentation/cubits/send_by_chat_id/send_by_chat_id_cubit.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';

import '../../../../../constants/assets.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/use_cases/send_message_by_chat_Id_use_case.dart';
import '../cubits/get_chat_by_user_id/get_chat_by_user_id_cubit.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.greyBackGround,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: AppSvgIcon(
                            path: Assets.iconsAttach,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (text) => _onSend(context, text),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              hintText: AppLocalizations.of(
                                context,
                              )!.typeYourMessage,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    _onSend(context, _controller.text);
                    _controller.clear();
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppSvgIcon(
                      path: Assets.iconsSend,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 140,
              child: Divider(thickness: 6, color: AppColors.greyBackGround),
            ),
          ],
        ),
      ),
    );
  }

  void _onSend(BuildContext context, String text) {
    final chatState = context.read<GetChatByUserIdCubit>().state;

    if (chatState is! GetChatByUserIdSuccess) return;

    context.read<SendByChatIdCubit>().sendMessageByChatId(
      SendMessageByChatIdParams(
        chatId: chatState.chatDetail.chatId,
        text: text,
      ),
    );
  }
}
