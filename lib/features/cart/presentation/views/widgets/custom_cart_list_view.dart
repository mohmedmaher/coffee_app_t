import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/values_manager.dart';
import 'custom_cart_list_tile.dart';

class CustomCartListView extends StatelessWidget {
  const CustomCartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return Expanded(
          child: ListView.builder(
            itemCount: coffeeCubit.userCurt.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p7_5),
                child: CustomCartListTile(
                  coffeeCubit: coffeeCubit,
                  index: index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
