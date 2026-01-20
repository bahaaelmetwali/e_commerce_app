
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/assets.dart';
import '../../../../core/config/theme/text_styles.dart' show TextStyles;
import '../../../../material/images/app_image_widget.dart';
import '../cubits/get_cached_data/get_cached_data_cubit.dart';

class MainDataSection extends StatelessWidget {
  const MainDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCachedDataCubit, GetCachedDataState>(
      builder: (context, state) {
        if (state is GetCachedDataLoaded) print(state.cachedData.avatar);
        return Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: state is GetCachedDataLoaded
                    ? AppImageWidget(
                        path: state.cachedData.avatar ?? Assets.imagesManTest,
                        canCache: true,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      )
                    : Icon(Icons.person, size: 40),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                state is GetCachedDataLoaded
                    ? state.cachedData.name
                    : "unknown",
                style: TextStyles.semiBold17,
              ),
            ),
          ],
        );
      },
    );
  }
}
