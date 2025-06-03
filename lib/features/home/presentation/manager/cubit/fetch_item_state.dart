part of 'fetch_item_cubit.dart';

@immutable
sealed class FetchItemState {}

final class FetchItemInitial extends FetchItemState {}

// ignore: must_be_immutable
final class FetchItemSuccess extends FetchItemState {
  List<ItemCardEntities> items;
  FetchItemSuccess({required this.items});
}

final class FetchItemLoading extends FetchItemState {}

final class FetchItemFailure extends FetchItemState {
  final String errorMessage;

  FetchItemFailure({required this.errorMessage});
}
