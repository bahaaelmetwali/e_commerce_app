import 'package:flutter/material.dart';

import '../../core/config/theme/app_colors.dart';
import '../../core/config/theme/text_styles.dart';

class CustomSliderRating extends StatefulWidget {
  final double min;
  final double max;
  final int divisions;
  final double initialValue;
  final ValueChanged<double>? onChanged;

  const CustomSliderRating({
    super.key,
    this.min = 0,
    this.max = 5,
    this.divisions = 10,
    this.initialValue = 0,
    this.onChanged,
  });

  @override
  State<CustomSliderRating> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSliderRating> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${widget.min}", style: TextStyles.medium16),

        const SizedBox(width: 8),

        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 0),
              activeTickMarkColor: Colors.transparent,
              inactiveTickMarkColor: Colors.transparent,
            ),
            child: Slider(
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              value: _value,
              label: _value.toStringAsFixed(1),
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ),

        const SizedBox(width: 8),

        Text("${widget.max}", style: TextStyles.medium16),
      ],
    );
  }
}
