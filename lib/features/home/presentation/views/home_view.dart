import 'package:coffee_app_t/features/favorite/presentation/views/favorite_view.dart';
import 'package:coffee_app_t/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:coffee_app_t/features/notification/presentation/views/notification_view.dart';
import 'package:coffee_app_t/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/views/cart_view.dart';
import '../../../shop/presentation/views/shop_view.dart';
import '../manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              ShopView(),
              CartView(),
              FavoriteView(),
              NotificationView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
