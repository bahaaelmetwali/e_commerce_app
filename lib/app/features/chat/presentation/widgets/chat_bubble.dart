import 'package:flutter/material.dart';

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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
          ),
          child: IntrinsicWidth(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMine ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '10:45 AM',
                          style: TextStyle(
                            fontSize: 11,
                            color: message.isMine
                                ? Colors.white70
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.check,
                          size: 12,
                          color: message.isMine
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
