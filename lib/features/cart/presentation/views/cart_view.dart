import 'package:coffee_app_t/core/utils/color_manager.dart';
import 'package:coffee_app_t/core/utils/font_manager.dart';
import 'package:coffee_app_t/core/utils/styles_manager.dart';
import 'package:coffee_app_t/features/cart/presentation/views/widgets/custom_cart_list_view.dart';
import 'package:coffee_app_t/features/cart/presentation/views/widgets/custom_curt_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../shop/presentation/views/widgets/custom_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s28,
            ),
            const CustomCurtAppBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
            BlocBuilder<CoffeeCubit, CoffeeState>(
              builder: (context, state) {
                var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
                return Text(
                  'Items (${coffeeCubit.userCurt.length})',
                  style: getSemiBoldStyle(
                    color:
                        isColorDark ? ColorManager.white : ColorManager.black,
                    fontSize: FontSize.s16,
                  ),
                );
              },
            ),
            const CustomCartListView(),
            const CustomButton(text: 'Pay Now'),
          ],
        ),
      ),
    );
  }
}
