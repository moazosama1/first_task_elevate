import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_task_elevate/core/base_state/base_state.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';

part 'fetch_item_state.dart';

class FetchItemCubit extends Cubit<FetchItemState> {
  FetchItemCubit({required this.homeRepo}) : super(FetchItemState());
  final HomeRepo homeRepo;
  Future<void> getAllData() async {
    await Future.wait<void>([
      fetchItems(),
      fetchItemsTwo(),
    ]);
  }

  Future<void> fetchItems() async {
    emit(state.copyWith(
        baseStateFetchItems: BaseStateFetchItems(isLoading: true)));

    var data = await homeRepo.fetchFeatureItems();
    data.fold(
      (l) {
        emit(state.copyWith(baseStateFetchItems: BaseStateFetchItems(data: l)));
      },
      (r) {
        emit(state.copyWith(
            baseStateFetchItems:
                BaseStateFetchItems(errorMessage: r.errorMessage)));
      },
    );
  }

  Future<void> fetchItemsTwo() async {
    await Future.delayed(Duration(seconds: 5));
    emit(state.copyWith(
        baseStateFetchItemsTwo: BaseStateFetchItems(isLoading: true)));

    var data = await homeRepo.fetchFeatureItems();
    data.fold(
      (l) {
        emit(state.copyWith(
            baseStateFetchItemsTwo: BaseStateFetchItems(data: l)));
      },
      (r) {
        emit(state.copyWith(
            baseStateFetchItemsTwo:
                BaseStateFetchItems(errorMessage: r.errorMessage)));
        log(r.errorMessage);
      },
    );
  }
}
