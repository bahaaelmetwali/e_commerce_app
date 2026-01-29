import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/material/images/app_image_widget.dart';
import 'package:mega/l10n/app_localizations.dart';

import '../../domain/entities/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final ChatMessageEntity message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isMine
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
                minWidth: MediaQuery.of(context).size.width * 0.2,
              ),
              decoration: BoxDecoration(
                color: message.isMine
                    ? AppColors.primaryColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(message.isMine ? 16 : 0),
                  bottomRight: Radius.circular(message.isMine ? 0 : 16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.media.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: message.media.map((url) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return AppImageWidget(
                                  path: url,
                                  fit: BoxFit.cover,
                                  width: constraints.maxWidth,
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMine
                          ? AppColors.whiteColor
                          : AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: AppLocalizations.of(context)!.localeName == 'ar'
                  ? null
                  : 8,
              left: AppLocalizations.of(context)!.localeName == 'ar' ? 8 : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat(
                      'h:mm a',
                    ).format(DateTime.parse(message.createdAt.toString())),
                    style: TextStyle(
                      fontSize: 11,
                      color: message.isMine
                          ? AppColors.secondaryGreyText
                          : AppColors.greyText,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.check,
                    size: 12,
                    color: message.isMine ? Colors.white70 : Colors.black54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
