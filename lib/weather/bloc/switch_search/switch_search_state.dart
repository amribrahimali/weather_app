part of 'switch_search_cubit.dart';

class SwitchSearchState extends Equatable {
  final bool isSearch;
  const SwitchSearchState({required this.isSearch});

  @override
  List<Object?> get props => [isSearch];
}
