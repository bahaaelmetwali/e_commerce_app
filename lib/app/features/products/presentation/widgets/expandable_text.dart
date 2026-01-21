
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/text_styles.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;      

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100,
  });

  @override
  State<ExpandableText> createState() => _SimpleExpandableTextState();
}

class _SimpleExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final isOverflow = widget.text.length > widget.trimLength;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: expanded
                ? widget.text
                : isOverflow
                ? '${widget.text.substring(0, widget.trimLength)}... '
                : widget.text,
            style: TextStyles.regular15.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
          if (isOverflow)
            TextSpan(
              text: expanded
                  ? AppLocalizations.of(context)!.readLess
                  : AppLocalizations.of(context)!.readMore,
              style: TextStyles.semiBold15.copyWith(
                color: AppColors.primaryText,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() => expanded = !expanded);
                },
            ),
        ],
      ),
    );
  }
}
