import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/Auth/domain/use_cases/update_email_use_case.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/utils/validator.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import '../../../material/textfields/custom_text_field.dart';
import '../../Auth/presentation/cubits/update_email/update_email_cubit.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateEmailCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.updateEmail,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 60,
          child: BlocConsumer<UpdateEmailCubit, UpdateEmailState>(
            listener: (context, state) {
              if (state is UpdateEmailSuccess) {
                showCustomSnackBar(
                  context,
                  message: AppLocalizations.of(
                    context,
                  )!.codeWasSentToYourNewEmail,
                );
                Navigator.pop(context);
              } else if (state is UpdateEmailFailure) {
                showCustomSnackBar(
                  context,
                  message: state.failure.toString(),
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              if (state is UpdateEmailLoading) {
                return CustomButton(
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  isLoading: true,
                  child: AppLocalizations.of(context)!.next,
                );
              }

              return CustomButton(
                onPressed: () {
                  final params = UpdateEmailParams(emailController.text);
                  context.read<UpdateEmailCubit>().updateEmail(params);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: AppLocalizations.of(context)!.next,
              );
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingMedium),
            child: CustomTextField(
              controller: emailController,
              labelText: AppLocalizations.of(context)!.newEmail,
              hintText: AppLocalizations.of(context)!.enterYourNewEmail,
              validator: Validator.emailValidator,
            ),
          ),
        ),
      ),
    );
  }
}
