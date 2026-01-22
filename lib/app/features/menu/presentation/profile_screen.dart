import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/Auth/domain/use_cases/update_profile_use_case.dart';
import 'package:mega/app/features/Auth/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';

import '../../../../constants/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/data/domain/entities/cached_user_entity.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/images/app_image_widget.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import 'cubits/get_cached_data/get_cached_data_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.cachedUserEntity});

  final CachedUserEntity cachedUserEntity;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.cachedUserEntity.name);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateProfileCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.accountInformation,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 60,
          child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileSuccess) {
                showCustomSnackBar(
                  context,
                  message: AppLocalizations.of(
                    context,
                  )!.yourResponseSubmittedSuccessfully,
                );
                    context.read<GetCachedDataCubit>().getCachedData();

                Navigator.pop(context);
              } else if (state is UpdateProfileFailure) {
                showCustomSnackBar(
                  context,
                  message: state.failure.toString(),
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              if (state is UpdateProfileLoading) {
                return CustomButton(
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  isLoading: true,
                  child: AppLocalizations.of(context)!.submit,
                );
              }

              return CustomButton(
                onPressed: () {
                  final params = UpdateUserProfileParams(
                    name: _nameController.text,
                    avatar: _selectedImage,
                  );
                  context.read<UpdateProfileCubit>().updateProfile(params);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: AppLocalizations.of(context)!.submit,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingMedium),
            child: Column(
              children: [
                const SizedBox(height: 24),

                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.greyBackGround,
                      child: ClipOval(
                        child: _selectedImage != null
                            ? Image.file(
                                _selectedImage!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : AppImageWidget(
                                path:
                                    widget.cachedUserEntity.avatar ??
                                    Assets.imagesManTest,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                canCache: true,
                              ),
                      ),
                    ),

                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.neaturlsColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.camera_copy,
                          color: AppColors.cardColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                CustomTextField(
                  controller: _nameController,
                  labelText: AppLocalizations.of(context)!.name,
                  hintText: AppLocalizations.of(context)!.enterYourName,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
