import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<String>> {
  List<String> previousSearches = [];

  SearchCubit() : super([]);

  void search(String query) {
    if (!previousSearches.contains(query)) {
      previousSearches.add(query);
    }
    emit(List.generate(10, (index) => '$query Result $index'));
  }

  void clearSearch() {
    emit([]);
  }
}