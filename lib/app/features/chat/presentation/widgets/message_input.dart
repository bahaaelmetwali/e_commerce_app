import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
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
  final ImagePicker _picker = ImagePicker();

  final List<XFile> _selectedImages = [];

  Future<void> _pickImagesFromGallery() async {
    final images = await _picker.pickMultiImage();
    if (images == null || images.isEmpty) return;

    setState(() {
      _selectedImages.addAll(images);
    });
  }

  void _showAttachBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRow([
                _attachItem(
                  Assets.iconsCameraIcon,
                  AppLocalizations.of(context)!.camera,
                  () {
                    Navigator.pop(context);
                    _pickImagesFromGallery();
                  },
                ),
                _attachItem(
                  Assets.iconsDocumentIcon,
                  AppLocalizations.of(context)!.document,
                  () {},
                ),
                _attachItem(
                  Assets.iconsGalleryIcon,
                  AppLocalizations.of(context)!.gallery,
                  () {},
                ),
              ]),
              const SizedBox(height: 16),
              _buildRow([
                _attachItem(
                  Assets.iconsSubTractIcon,
                  AppLocalizations.of(context)!.polling,
                  () {},
                ),
                _attachItem(
                  Assets.iconsLocationIcon,
                  AppLocalizations.of(context)!.location,
                  () {},
                ),
                _attachItem(
                  Assets.iconsAudioIcon,
                  AppLocalizations.of(context)!.audio,
                  () {},
                ),
              ]),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(List<Widget> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _attachItem(String path, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.greyBackGroundCard,
            child: AppSvgIcon(path: path),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyles.medium14),
        ],
      ),
    );
  }

  Widget _imagesPreview() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _selectedImages.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final image = _selectedImages[index];

          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(image.path),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImages.removeAt(index);
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedImages.isNotEmpty) _imagesPreview(),
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
                      children: [
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () => _showAttachBottomSheet(context),
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

    if (text.trim().isEmpty && _selectedImages.isEmpty) return;

    context.read<SendByChatIdCubit>().sendMessageByChatId(
      SendMessageByChatIdParams(
        chatId: chatState.chatDetail.chatId,
        text: text,
        media: _selectedImages.map((e) => File(e.path)).toList(),
      ),
    );

    _controller.clear();
    setState(() {
      _selectedImages.clear();
    });
  }
}
