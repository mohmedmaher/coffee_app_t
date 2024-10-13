import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemCubit extends Cubit<int> {
  SelectedItemCubit() : super(0);

  void selectItem(int index) {
    emit(index);
  }
}