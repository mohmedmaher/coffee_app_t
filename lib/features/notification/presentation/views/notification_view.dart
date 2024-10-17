import 'package:coffee_app_t/core/utils/font_manager.dart';
import 'package:coffee_app_t/core/utils/strings_manager.dart';
import 'package:coffee_app_t/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_manager.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          AppStrings.notification,
          style: getSemiBoldStyle(
            color: isColorDark ? ColorManager.white : ColorManager.black,
            fontSize: FontSize.s22,
          ),
        ),
      ],
    );
  }
}
