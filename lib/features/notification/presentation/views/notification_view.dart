import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/manager/theme/theme_cubit.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('data'),
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
      ],
    );
  }
}
