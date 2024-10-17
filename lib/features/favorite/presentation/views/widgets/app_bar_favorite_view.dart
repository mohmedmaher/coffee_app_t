import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../home/presentation/manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class AppBarFavoriteView extends StatelessWidget {
  const AppBarFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainerIcon(
          onTap: () {
            context.read<BottomNavBarCubit>().updateIndex(0);
          },
          imagePath: ImageAssets.lineArrowLeft,
          colorFilter: ColorFilter.mode(
            isColorDark ? ColorManager.white : ColorManager.black,
            BlendMode.srcIn,
          ),
        ),
        Text(
          AppStrings.favorite,
          style: getBoldStyle(
              color: isColorDark ? ColorManager.white : ColorManager.black,
              fontSize: FontSize.s16),
        ),
        CustomContainerIcon(
          onTap: () {
            context.read<CoffeeCubit>().clearFavorite();
          },
          imagePath: ImageAssets.deleteIcon,
        ),
      ],
    );
  }
}

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon(
      {super.key,
      required this.onTap,
      required this.imagePath,
      this.colorFilter});

  final void Function() onTap;
  final String imagePath;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppSize.s50,
        height: AppSize.s50,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isColorDark
                ? ColorManager.darkBlueGrey
                : ColorManager.greyOpacityLight,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              imagePath,
              colorFilter: colorFilter,
            ),
          ),
        ),
      ),
    );
  }
}