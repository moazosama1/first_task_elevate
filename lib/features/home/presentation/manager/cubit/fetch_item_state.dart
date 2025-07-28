part of 'fetch_item_cubit.dart';

class FetchItemState {
  final BaseStateFetchItems? baseStateFetchItems;
  final BaseStateFetchItems? baseStateFetchItemsTwo;

  FetchItemState({
    this.baseStateFetchItems,
    this.baseStateFetchItemsTwo,
  });

  FetchItemState copyWith({
    BaseStateFetchItems? baseStateFetchItems,
    BaseStateFetchItems? baseStateFetchItemsTwo,
  }) {
    return FetchItemState(
      baseStateFetchItems: baseStateFetchItems ?? this.baseStateFetchItems,
      baseStateFetchItemsTwo:
          baseStateFetchItemsTwo ?? this.baseStateFetchItemsTwo,
    );
  }
}

class BaseStateFetchItems {
  final bool isLoading;
  final List<ItemCardEntities> data;
  final String errorMessage;

  BaseStateFetchItems({
    this.data = const [],
    this.isLoading = false,
    this.errorMessage = "",
  });
}

