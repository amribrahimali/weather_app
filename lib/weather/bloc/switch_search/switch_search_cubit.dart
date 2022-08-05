import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_search_state.dart';

class SwitchSearchCubit extends Cubit<SwitchSearchState> {
  SwitchSearchCubit() : super(const SwitchSearchState(isSearch: false));

  void switchSearch(bool isSearch) {
    emit(SwitchSearchState(isSearch: isSearch));
  }
}
