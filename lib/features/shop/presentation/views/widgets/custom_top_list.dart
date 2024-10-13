import 'package:coffee_app_t/core/utils/color_manager.dart';
import 'package:coffee_app_t/core/utils/strings_manager.dart';
import 'package:coffee_app_t/core/utils/styles_manager.dart';
import 'package:coffee_app_t/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/selected_item_cubit/selected_item_cubit.dart';

class CustomTopList extends StatelessWidget {
  const CustomTopList({super.key});

  final List<String> drinks = const [
    AppStrings.espresso,
    AppStrings.latte,
    AppStrings.cappuccino,
    AppStrings.cafetiere,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectedItemCubit(),
      child: BlocBuilder<SelectedItemCubit, int>(
        builder: (context, selectedIndex) {
          final isColorDark = Theme.of(context).brightness == Brightness.dark;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              4,
              (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    context.read<SelectedItemCubit>().selectItem(index);
                  },
                  child: Column(
                    children: [
                      Text(drinks[index],
                          style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.brownShade
                                : isColorDark
                                    ? ColorManager.lightText
                                    : ColorManager.grey,
                            fontSize: AppSize.s14,
                          )),
                      if (isSelected)
                        Container(
                          margin: const EdgeInsets.only(top: AppMargin.m5),
                          width: AppSize.s10,
                          height: AppSize.s10,
                          decoration: BoxDecoration(
                            color: ColorManager.brownShade,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
